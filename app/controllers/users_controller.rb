class UsersController < ApplicationController

 def index
  @book = Book.new
  @users = User.all
  @user = current_user
 end

 def show
  @book = Book.new
  @user = User.find(params[:id])
  @posted_book = Book.where(user_id: params[:id])
  @books = @posted_book.all
 end

 def edit
  @user = User.find(params[:id])
  unless @user.id == current_user.id
   redirect_to user_path(current_user.id)
  end
 end

 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
     redirect_to user_path(@user.id)
     flash[:notice] = "You have updated user successfully."
  else
     render "edit"
  end
 end

 def followers_index
  user = User.find(params[:id])
  @users = user.following_user.where.not(id: user.id)
 end

 def followed_index
  user = User.find(params[:id])
  @users = user.follower_user.where.not(id: user.id)
 end

 private
 def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
 end

end
