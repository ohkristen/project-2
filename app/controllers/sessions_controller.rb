class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #if the user exists AND the password is correct
    if user && user.authenticate(params[:session][:password])
      #save the user id  inside the browser cookie
      #this is how we keep the user logged in
      #as they browse around the site
      log_in user
      redirect_to user, notice: "logged in!"
    else
      #if users login doesnt work send them back to login
      flash[:danger] = "invalid login credentials"
      render "new"
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

end
