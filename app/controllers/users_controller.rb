class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  before_action :authorize_user, only: %i[ edit update destroy]

  def authorize_user
    user = User.find(params[:id])
    return unless user.id != session[:user_id]

    redirect_to root_path, alert: 'You are not authorized to access this page.'
  end

  def show
    @user = User.find(params[:id])
    @userSubtype = @user.role

    # Fetch the mentor or student based on the user's role
    @userSub = @userSubtype == 'mentor' ? @user.mentor : @user.student
  end

  def edit
    @user = User.find(params[:id])
    @userSubtype = @user.role

    # Fetch the mentor or student based on the user's role
    @userSub = @userSubtype == 'mentor' ? @user.mentor : @user.student

    # Assign to instance variables if they are of mentor or student subtype
    @student = @userSub if @userSubtype == 'student'
    @mentor = @userSub if @userSubtype == 'mentor'
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
          # Add debugging here
          puts "User role: #{@user.role}, student present: #{@user.student.present?}"
          puts "Student params: #{student_params.inspect}"

          # Update the existing associated record
          if @user.role == 'student' && @user.student.present?
            success = @user.student.update(student_params)
            puts "Student update result: #{success}, errors: #{@user.student.errors.full_messages}" unless success
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

  private

  def set_user
    @user = User.find(params[:id])

    # Find if user is a mentor or student
    @userSubtype = @user.role

    # Fetch the mentor or student based on the user's role
    @userSub = @userSubtype == 'mentor' ? Mentor.find_by(user_id: @user.id) : Student.find_by(user_id: @user.id)

    # Check if mentor or student record exists
    if @userSub.nil?
      flash[:alert] = 'The user record is missing mentor/student data.'
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def student_params
    params.require(:student).permit(:major, user_attributes: %i[id first_name last_name email phone_number])
  end

  def mentor_params
    params.require(:mentor).permit(:user_id, :profession, :specialty, :mentorType, :location, user_attributes: %i[id first_name last_name email phone_number])
  end
end
