class BooksController < ApplicationController
  def new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end
  
  def index
  end
  
  def show
    @books = Book.all
  end
  
  def edit
    @book = Book.find(@params[:id])
    @book.update
    redirect_to 
  end
  
  def update
    
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path(@book.id)
  end
  
  private
  
  def book_params
    params.permit(:title, :body)
  end
  
end
