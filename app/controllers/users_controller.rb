class UsersController < ApplicationController
 
 def index
  @users = User.all
 end
 
 def show
  @books = Book.all
 end
 
 def edit
  @user = User.find_by(id: current_user.id)
 end
 
 def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path
 end
 
 private
 def user_params
  params.require(:user).permit(:name, :introduction)
 end
 
end
