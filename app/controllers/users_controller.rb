class UsersController < ApplicationController
  def new
    @books = Books.new
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  unless user.id == current_user.id
    render "edit"
  else
    redirect_to user_path(current_user)
  end
  
  def update
    @user = User.find(params[:id])
  end
    
  end
end
