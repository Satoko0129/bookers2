class BooksController < ApplicationController
  def new
    @books = Books.new
  end

  def index
    @books = Book.page(params[:page])
  end

  def show
  end

  def edit
  end
end
