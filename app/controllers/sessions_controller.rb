class SessionsController < ApplicationController
	layout 'layouts/authentication'
	before_action :is_logged_in?, only:[:new]
	def new
	end

	def register
	end

	def user_register
		check_user = User.find_by_email(params[:email])
		if check_user
			flash[:danger] = "Email already exists..." 
			redirect_to login_path
		else
			@user = User.new
			@user.first_name = params[:first_name]
			@user.last_name  = params[:last_name]
			@user.email      = params[:email]
			@user.password   = params[:password]
			if @user.save
				flash[:success] = "User Successfully Registered..Please login"
				redirect_to login_path
			else
				flash[:danger] = "Error.."
				redirect_to signup_path
			end
		end		
	end
	
	def user_login
	    user = User.find_by_email(params[:email])
	    if user && user.authenticate(params[:password])
	      session[:user_id] = user.id
	      flash[:success] = "Successfully Logged in!"
	      redirect_to root_url
	    else
	      flash[:danger] = "Invalide Email or password"
	      render "new"
	    end
	end

	def destroy
	    session[:user_id] = nil
	    flash[:primary] = "User Logged out!"
	    redirect_to root_url
	end

end
