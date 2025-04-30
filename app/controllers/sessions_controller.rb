class SessionsController < ApplicationController
  def create
    user_info = request.env['omniauth.auth']
    user = find_or_create_user(user_info)
    session[:user_id] = user.id

    if first_time_login?(user)
      session[:first_time_user] = true
      redirect_to select_role_path, notice: 'Welcome! Please customize your profile.'
    else
      redirect_to root_path, notice: 'Logged in successfully!'
    end
  end

  def destroy
    session[:user_id] = nil
    session.delete(:first_time_user)
    redirect_to root_path, notice: 'Logged out!'
  end

  def select_role; end

  def update_role
    @user = User.find(session[:user_id])
    role = params[:user][:role] # This is the string 'student' or 'mentor'
    session[:first_time_user] = false

    Rails.logger.debug "Attempting to update user #{@user.id} with role: #{role}"

    if %w[student mentor].include?(role)
      # Create the associated record
      if role == 'student'
        Student.create(user_id: @user.id)
      else
        Mentor.create(user_id: @user.id)
      end

      # Since role is an enum, use the symbol form to set it correctly
      @user.role = role # Convert string to symbol for enum

      if @user.save
        redirect_to edit_user_path(@user), notice: "Welcome! Please customize your #{role} profile."
      else
        Rails.logger.error "Failed to update role. Errors: #{@user.errors.full_messages.join(', ')}"
        redirect_to select_role_path, alert: 'There was an error updating your profile.'
      end
    else
      redirect_to select_role_path, alert: 'Please select a valid role.'
    end
  end

  private

  def find_or_create_user(user_info)
    User.find_or_create_by(email: user_info.info.email) do |user|
      user.first_name = user_info.info.first_name
      user.last_name = user_info.info.last_name
      user.provider = user_info.provider
      user.uid = user_info.uid
    end
  end

  def first_time_login?(user)
    user.mentor.nil? && user.student.nil?
  end

  def role_params
    params.require(:user).permit(:role, :first_name, :last_name, :email)
  end
end
