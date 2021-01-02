class UsersController < ApplicationController
before_action :authenticate_user!, only: [:edit,:update]

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = Book.where(params[:id])
    p @book
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
     render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end