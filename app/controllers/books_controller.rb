class BooksController < ApplicationController
  def index
    @book = Book.all
    @book = Book.new
  end
  
  def create
  book = Book.new (book_params)
  book.save
  redirect_to'/books'
  end
  
  def show
    @books = Book.find(book_params[:id])
  end

  def edit
  end
  
  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
