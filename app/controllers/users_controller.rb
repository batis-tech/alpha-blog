class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
      @articlesIndex = @user.articles
    end
  def new
    @user = User.new
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
   @user = User.find(params[:id])
   if @user.update(user_perams)
     flash[:notice] = "Your account has been updated successfuly #{@user.username}"
     redirect_to articles_path
  else
    render 'edit'
  end
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
