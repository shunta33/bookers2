class BooksController < ApplicationController

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to root_path
  end

  def edit
  end

  def index
    @book = Book.new
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def book_params
    params.require(:book).permit(:name, :body)
  end

end
