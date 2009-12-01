class UsersController < ApplicationController
	layout 'general'
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  

  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user
      session["type_user"] = @user.login
      $admin = "admin"
      redirect_to "/principal/main_layout"
    else
      render :action => 'new'
    end
  end

end