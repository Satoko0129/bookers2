class UsersController < ApplicationController
  def new
    @books = Books.new
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
    @book = Book.new
  end

  def edit
  end
end
