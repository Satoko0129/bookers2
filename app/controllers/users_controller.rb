class UsersController < ApplicationController
  def new
    @books = Books.new
  end

  def index
    @books = Book.all
  end

  def show
    @user = current_user
    @books = @user.books.page(params[:page])
  end

  def edit
  end
end
