class UsersController < ApplicationController
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
  end

  def update
    @user = User.find(params[:id])
    #@user.user_id = current_user.id
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
end
