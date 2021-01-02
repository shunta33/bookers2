class UsersController < ApplicationController
before_action :authenticate_user!, only: [:edit,:update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.where(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end