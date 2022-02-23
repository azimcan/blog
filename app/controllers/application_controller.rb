class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?

  def login(user_id)
    session[:user_id] = user_id
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user
  end

  def allowed?
    redirect_to root_path, notice: 'You are not authorized to do this.' if current_user.nil?
  end
end
