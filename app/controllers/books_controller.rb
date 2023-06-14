class BooksController < ApplicationController
  before_action :authenticate_user!

  def new
    @books = Books.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    flash[:notice] = "You have created book successfully."
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @newbook = Book.new
    @user = User.find(@book.user_id)
    @book_comment = BookComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    if @book.save
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

  def user_params
    params.require(:user).permit(:profile_image)
  end
end