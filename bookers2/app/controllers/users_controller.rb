class UsersController < ApplicationController
before_action :authenticate_user!, only: [:edit,:update,:show,:index]

  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book_show = Book.new
    @user = User.find(params[:id])
    @book = Book.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
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