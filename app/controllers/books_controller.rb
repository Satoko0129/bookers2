class BooksController < ApplicationController
  def new
    @books = Books.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
  end


  private

  def book_params
    params.require(:book).permit(:title, :image, :opinion)
  end
end
