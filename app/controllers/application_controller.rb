class ApplicationController < ActionController::Base
	helper_method :current_user,:is_logged_in?
	def current_user
	    if session[:user_id]
	      @current_user ||= User.find(session[:user_id])
	    else
	      @current_user = nil
	    end
	end

	def authenticated_user!	
		redirect_to login_path if current_user.blank?		
	end

	def is_logged_in?
		redirect_to users_path if current_user.present?	
	end
end
