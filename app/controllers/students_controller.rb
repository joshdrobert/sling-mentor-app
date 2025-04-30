class StudentsController < ApplicationController
  before_action :set_student, only: %i[show edit update destroy]
  before_action :authorize_student, only: %i[show edit update destroy]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
    @student = Student.find(params[:id])
  end

  # GET /students/new
  def new
    @student = Student.new
    @student.build_user
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
    @user = @student.user
  end

  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        # Handle specialties if any
        if params[:student][:specialty_ids].present?
          specialty_ids = params[:student][:specialty_ids].reject(&:blank?)
          @student.specialty_ids = specialty_ids.map(&:to_i)
        end

        format.html { 
          redirect_to user_path(@student.user), 
          notice: 'Student was successfully created.' 
        }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        # Handle specialties
        specialty_ids = params[:student][:specialty_ids] || []
        specialty_ids = specialty_ids.reject(&:blank?)
        @student.specialty_ids = specialty_ids.map(&:to_i)

        format.html { 
          if request.referer&.include?('/admin/') && current_user.isAdmin?
            redirect_to admin_path(@student.user), 
                        notice: 'Student was successfully updated.'
          else
            redirect_to user_path(@student.user), 
                        notice: 'Student was successfully updated.'
          end
        }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { 
        redirect_to students_path, 
                    status: :see_other, 
                    notice: 'Student was successfully destroyed.' 
      }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Authorization - allow admin or the student themselves
  def authorize_student
    unless current_user.isAdmin? || @student.user_id == current_user.id
      redirect_to root_path, 
                  alert: 'You are not authorized to perform this action.'
    end
  end

  # Only allow a list of trusted parameters through.
  def student_params
    # base set of student attrs
    allowed = [
      :major,
      :classification,
      :mentor_type_id,
      specialty_ids: []
    ]

    # build up the list of permitted user_attributes
    user_attrs = %i[
      id
      first_name
      last_name
      email
      phone_number
    ]

    if current_user.isAdmin?
      # let admins change the is_admin flag and (on create) the password
      user_attrs << :isAdmin
      if action_name == "create"
        user_attrs += %i[password password_confirmation]
      end
    end

    params
      .require(:student)
      .permit(*allowed, user_attributes: user_attrs)
  end
end