class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :allowed?, only: %i[edit update]

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user.id)
      redirect_to profile_path(@user), notice: 'Register successfull.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: 'Updated information.'
    else
      render :edit, layout: 'edit'
    end
  end

  def show
    @posts = @user.posts
  end

  private

  def set_user
    @user = if params.key? :username
              User.find_by_username(params[:username])
            else
              User.find(params[:id])
            end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
