class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(:email => params[:email]).first
    if user && user.authenticate(params[:password])
      redirect_to users_url, :notice => "Loged in!"
    else
      render "new"
    end
  end
end
