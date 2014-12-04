class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:restaurant_id], params[:password])
	if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to items_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to items_path, :notice => "Logged out!"
  end
end
