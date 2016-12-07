class ResearchersController < ApplicationController
  def new
    @researcher = Researcher.new
  end

  def  create
    researcher_params = params.require(:researcher).permit([:first_name,
                                                :last_name,
                                                :email,
                                                :password,
                                                :password_confirmation])
    @researcher = Researcher.new researcher_params
    if @researcher.save
      session[:user_id] = @researcher.id
      redirect_to studies_path, notice: 'Thank you for signing up'
    else
      render :new
    end
  end



end
