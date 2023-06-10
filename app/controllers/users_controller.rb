class UsersController < ApplicationController
  def new
    @books = Books.new
  end

  def index
    @books = Book.all
  end

  def show
    @user = current_user
    @books = @user.books
  end

  def edit
    user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to books_path
  end
  
  def update
  if current_user.update(user_params)
    redirect_to root_path
  else
    render :edit
  end
end
    
  end
end
