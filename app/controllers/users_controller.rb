class UsersController < ApplicationController
  def index
    @book = Book.new
    @users = User.all
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def show
    @book = Book.new
    @books = Book.all
  end

  def edit
  end

  def user_params
    params.require(:user).permit(:name, :introducion)
  end
end
