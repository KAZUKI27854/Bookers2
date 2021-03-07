class BooksController < ApplicationController
  def new
  end
  
  def create
    @user = current_user
    @book = Book.new(book_params)
    @books = Book.all
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.id)
       flash[:notice] = "You have created book successfully."
    else
       render "index"
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end
  
  def show
    @book_show = Book.find(params[:id])
    @user = User.find(@book_show.user_id)
  end
  
  def edit
    @book = Book.find(params[:id])
    unless current_user == @book.user 
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book.id)
       flash[:notice] = "You have updated book successfully."
    else
       render "edit"
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
