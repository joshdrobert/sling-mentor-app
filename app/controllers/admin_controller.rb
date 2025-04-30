class AdminController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authorize_admin, except: [:index]
  before_action :check_admin_user, only: [:index]
  #before_action :load_specialties, only: [:specialties]

  def index
    @users = User.all
  
    # Filter by search term (name or email)
    if params[:search].present?
      search_term = "%#{params[:search]}%"
  
      # Split the search term if it contains spaces to handle first name and last name
      names = params[:search].split(/\s+/, 2)
      if names.length == 2
        first_name, last_name = names
        @users = @users.where(
          'first_name ILIKE ? AND last_name ILIKE ? OR email ILIKE ?',
          "%#{first_name}%", "%#{last_name}%", "%#{params[:search]}%"
        )
      else
        @users = @users.where(
          'first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?',
          search_term, search_term, search_term
        )
      end
    end
  
    # Filter by role (mentor or student)
    @users = @users.where(role: params[:role]) if params[:role].present?
  
    # Filter by admin status
    @users = @users.where(isAdmin: params[:isAdmin] == 'true') if params[:isAdmin].present?
  
    # Order by last name, then first name
    @users = @users.order(:last_name, :first_name)
  
    # Paginate if using Kaminari or will_paginate
    @users = @users.paginate(page: params[:page], per_page: 20)
  end
  

  def authorize_admin
    return if current_user&.isAdmin

    redirect_to root_path, alert: 'You are not authorized to access this page.'
  end

  def check_admin_user
    redirect_to root_path, alert: 'You are not authorized to access this page.' unless current_user&.isAdmin
  end

  def show
    @user = User.find(params[:id])
    @userSubtype = @user.role
  end

  def edit
    @user = User.find(params[:id])
    @userSubtype = @user.role
    @userSub = @userSubtype == 'mentor' ? @user.mentor : @user.student
    @student = @userSub if @userSubtype == 'student'
    @mentor = @userSub if @userSubtype == 'mentor'
  end

  def new
    @user = User.new
    @user.build_student
    @user.build_mentor

    @user.role = "student" if @user.new_record?
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        # Create associated student/mentor record
        if @user.role == 'student'
          student = Student.new
          student.classification = student_params[:classification].downcase if student_params[:classification].present?
          student.major = student_params[:major]
          student.specialty_ids = Array(student_params[:specialty_ids]) if student_params[:specialty_ids].present?
          student.user = @user
          student.save
        elsif @user.role == 'mentor'
          mentor = Mentor.new(mentor_params)
          mentor.user = @user
          mentor.save
        end

        format.html { redirect_to admin_path(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    old_role = @user.role

    respond_to do |format|
      if @user.update(user_params)
        # Handle role change
        if @user.role != old_role
          # Your existing role change code...
        else
          # Update the existing associated record
          if @user.role == 'student' && @user.student.present?
            @user.student.update(student_params)
          elsif @user.role == 'mentor' && @user.mentor.present?
            @user.mentor.update(mentor_params)
          end
        end

        format.html { redirect_to admin_path(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    if @user.id == 0
      respond_to do |format|
        format.html { redirect_to admin_index_path, notice: 'Cannot delete user' }
        format.json { head :no_content }
      end
      return
    end

    # create user with user id 0 if not created already
    if User.find_by(id: 0).nil?
      user = User.new
      user.id = 0
      user.first_name = 'Deleted'
      user.last_name = 'User'
      user.email = "deleted@deleted.deleted"
      user.save      
    end

    @user.questions.update_all(user_id: 0) #to the deleted user
    @user.comments.update_all(user_id: 0) #to the deleted user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_index_path, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end



  def specialties
    @specialties = Specialty.includes(:mentor_type).all
    
  end
  
  def new_specialty
    @specialty = Specialty.new
    @mentor_types = MentorType.all
  end
  
  def create_specialty
    @specialty = Specialty.new(new_specialty_params)
    if @specialty.save
      redirect_to admin_index_path, notice: 'Specialty was successfully created.'
    else
      @mentor_types = MentorType.all
      render :new_specialty, status: :unprocessable_entity
    end
  end

  def edit_specialty
    @specialty = Specialty.includes(:mentor_type).find(params[:id])
  end

  def update_specialty
    @specialty = Specialty.find(params[:id])
    if @specialty.update(new_specialty_params)
      redirect_to admin_index_path, notice: 'Specialty was successfully updated.'
    else
      @mentor_types = MentorType.all
      render :edit_specialty, status: :unprocessable_entity
    end
  end

  def destroy_specialty
    @specialty = Specialty.find(params[:id])

    MentorSpecialty.where(specialty_id: @specialty.id).delete_all
    # Set specialty_id to nil for all mentors associated with this specialty
    #Mentor.where(specialty_id: @specialty.id).update_all(specialty_id: nil)

    StudentSpecialty.where(specialty_id: @specialty.id).delete_all

    if @specialty.destroy
      redirect_to admin_index_path, notice: 'Specialty was successfully deleted.'
    else
      redirect_to admin_index_path, alert: 'Failed to delete specialty.'
    end
  end


  private

  def set_user
    @user = User.find(params[:id])
    @userSubtype = @user.role
    @userSub = @userSubtype == 'mentor' ? Mentor.find_by(user_id: @user.id) : Student.find_by(user_id: @user.id)
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :phone_number, :role, :isAdmin,
      student_attributes: [:id, :major, :classification, specialty_ids: []],
      mentor_attributes: [:id, :profession, :mentor_type_id, specialty_ids: []]
    )
  end

  def student_params
    params.fetch(:student, {}).permit(:major, :classification, :specialty_id)
  end

  def mentor_params
    params.fetch(:mentor, {}).permit(:profession, :specialty_id, :mentor_type_id)
  end

  def new_specialty_params
    params.fetch(:specialty, {}).permit(:name, :short_name, :mentor_type_id)
  end
  
end
