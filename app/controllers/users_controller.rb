class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  before_action :authenticate_user!
  before_action :ensure_correct_user,{only: [:edit]}



  def index
    @newbook = Book.new
    @user = current_user
    @users = User.all
  end

  def show
    @newbook = Book.new
    @user = User.find(params[:id])
    @books = Book.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    flash[:notice] = 'update successfully.'

    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end


private

  def ensure_correct_user
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

end