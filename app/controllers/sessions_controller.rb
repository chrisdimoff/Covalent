class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email].downcase
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if user.type.downcase == "researcher"
        redirect_to studies_path, notice: "Signed In"
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

    if Rails.env.downcase == "production"
      redirect_to unbounce_path
    else
      redirect_to root_path, notice: 'Signed out!'
    end
  end
end
