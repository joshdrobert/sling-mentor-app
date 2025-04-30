class ApplicationController < ActionController::Base
  helper_method :user_index_path, :current_user, :user_name

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def user_name
    return unless User.exists?(id: session[:user_id])

    User.find(session[:user_id]).first_name
  end

  def user_index_path
    if User.exists?(id: session[:user_id])
      user_path(id: session[:user_id])
    else
      root_path
    end
  end

end
