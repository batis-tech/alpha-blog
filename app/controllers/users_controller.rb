class UsersController < ApplicationController

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_perams)
    if @user.save
      flash[:notice] = "Welcome to  #{@user.username},you have successfuly signed up"
      redirect_to articles_path

  else
    render 'new'
  end
  end

  private
  def user_perams
    params.require(:user).permit(:username, :email, :password)
  end
end
