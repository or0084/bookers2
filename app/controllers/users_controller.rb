class UsersController < ApplicationController
  #before_action :correct_user, only: [:edit, :update]

  def index
    @book = Book.new
    @users = User.all
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] = 'You have updated user successfully.'
       redirect_to user_path(@user.id)
    else
      render "edit"
    end
  end


  private


  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  #def correct_user
    #user = User.find(params[:id])
    #if current_user.id != user.id
      #redirect_to user_path(current_user)
    #end
  #end

end


