class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user.id)
      redirect_to profile_path(@user), notice: 'Register successfull.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def profile
    @posts = current_user.posts
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
