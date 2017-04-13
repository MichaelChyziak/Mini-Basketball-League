module SessionsHelper

  # Log in user
  def log_in(user)
    session[:user_id] = user.id
  end

 # Defining current user
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = [:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true user is current_user
  def current_user?(user)
    user == current_user
  end

  # Check if user is logged in
  def logged_in?
    !current_user.nil?
  end

   # Logs out the current user.
   def log_out
     session.delete(:user_id)
     @current_user = nil
   end
 end
