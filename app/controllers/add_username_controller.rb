class AddUsernameController < ApplicationController
  def edit; end

  def update
    @user = current_user
    if @user.update(params.require(:user).permit(:username, :password))
      redirect_to profile_path(@user.username), notice: 'Added username.'
    else
      render :add_username, status: :unprocessable_entity
    end
  end
end
