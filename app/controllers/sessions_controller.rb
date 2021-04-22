class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase)#to check if the email iss exist on the databasse table
    if user && user.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      flash[:notice] = "logged in succcessfully"
      redirect_to user
    else
      flash.now[:alert] = "there wass somthing wrong with your database"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "logged out"
    redirect_to  articles_path
  end
end
