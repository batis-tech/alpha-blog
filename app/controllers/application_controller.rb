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

    def require_user
      if !logged_in?
        flash[:alert] = "Yoou must be logged in to perform that action"
        redirect_to login_path
    end
  end
end
