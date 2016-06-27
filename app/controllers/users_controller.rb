class UsersController < ApplicationController
  #skip_before_filter :require_login, only: [:new]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  skip_before_filter :require_login, only: [:new]

  # Make the user an admin
  def enable_admin
    if current_user.admin?
      user = User.find(params[:id])
      user.update_attribute("admin", true)
      redirect_to "/users"
    else
      redirect_to "/home"
      flash[:warning] = "Only admins can perform that action."
    end
  end

  # Make the user not an admin
  def disable_admin
    if current_user.admin?
      user = User.find(params[:id])
      user.update_attribute("admin", false)
      redirect_to "/users"
    else
      redirect_to "/home"
      flash[:warning] = "Only admins can perform that action."
    end
  end

  def index
    if current_user.admin?
      @users = User.all
    else
      redirect_to "/home"
      flash[:warning] = "Only admins can access that page."
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Mini Basketball League!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
