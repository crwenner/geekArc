class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:username], params[:password])
    if user
      redirect_back_or_to root_url, :notice => "Logged in!"
    else
      flash.now.alert = "Incorrect username or password"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged Out!"
  end
end
