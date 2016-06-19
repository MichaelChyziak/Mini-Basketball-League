class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  #Makes users require a login to view any pages (only login page will be exception)
  #http://stackoverflow.com/questions/5056451/redirect-to-login-page-if-user-not-logged-in
  before_filter :require_login

  private
    #For forcing users to require to login
    def require_login
      if request.fullpath == "/about"
        #Let everybody (even not logged in users) see the about page
      else
        unless current_user
          redirect_to root_url
        end
      end
    end
end
