class ApplicationController < ActionController::Base

  helper_method :current_user , :logged_in?
  #to make available on  views and controller
  def current_user
   @current_user ||= User.find(session[:user_id]) if session[:user_id]
 #if current_user exist or equil to this user then keep going
    end

    def logged_in?
      !!current_user
      #to check if current_user is access, yes or no
    end
end
