class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
  book = Book.new(book_params)
   @book=Book.new(book_params)
    if @book.save
    redirect_to book_path(@book), notice:"Book was successfully created."
    else
    render :new
    end
   
  end
   
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
    
    book = Book.new(book_params)
    @book= Book.find(params[:id])
     if @book.update(book_params)
     redirect_to book_path(@book),notice:"Book was successfully updated."
     else
     render:edit
    
    end
    
    if book.save
    redirect_to book_path (book.id)
    else
     @books =Book.all
     render:index
   end
  
  end
  
  def destroy
   book = Book.find(params[:id])
   book.destroy
   redirect_to'/books'
  end
  
  private
   def book_params
   params.require(:book).permit(:title, :body)
  end
end
