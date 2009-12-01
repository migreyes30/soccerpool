# This controller handles the login/logout function of the site.  
class SessionController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  layout 'general'
  include AuthenticatedSystem

  # render new.rhtml
  def new
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      session["type_user"] = params[:login]
      $admin = "admin"
      redirect_to "/principal/main_layout"
    else
    	flash[:error] = "The login or password provided aren't correct. Please re-enter your data!"
      render :action => 'new'
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end

end
