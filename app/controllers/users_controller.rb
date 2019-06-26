class UsersController < ApplicationController
  before_action :authenticated_user!, only: [:show, :edit, :update, :destroy, :index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]  
  
  def index
    @users = User.all
  end
  
  def show    
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User was successfully created."
      redirect_to @user
    else
      flash[:danger] = "Something went wrong."
      redirect_to new_user_path
    end    
  end

  def update
     if @user.update(user_params)
      flash[:primary] = " User was successfully updated. "
      redirect_to @user
     else
      flash[:danger] = "Error."
      render 'show'
     end
    # respond_to do |format|
    #   if @user.update(user_params)
    #     format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @user }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    if @user.destroy
      flash[:success] = "User Deleted.."
      redirect_to users_url
    else
      flash[:danger] = "Error.. Something wrong"
      redirect_to users_url
    end    
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
