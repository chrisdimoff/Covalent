class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email].downcase
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.type == "researcher"
        redirect_to dashboard_path, notice: "Signed In"
      else
        redirect_to root_path, notice: 'Signed In'
      end
    else
      flash.now[:alert] = 'Wrong credentials'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Signed out!'
  end
end
