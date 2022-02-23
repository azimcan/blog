class SessionsController < ApplicationController
  before_action :allowed?, only: [:destroy]

  def new; end

  def create
    user = User.find_by_email params[:email]

    if user&.authenticate(params[:password])
      login(user.id)
      redirect_to root_path, notice: 'Login successful.'
    else
      flash[:notice] = 'Email or password is incorrect.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logout successful.'
  end
end
