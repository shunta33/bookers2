class BooksController < ApplicationController
before_action :authenticate_user!

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to root_path
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
    p @users
  end

  def show
    @book = Book.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
