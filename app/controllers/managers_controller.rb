class ManagersController < ApplicationController
  before_action :find_manager, only: [:show, :download]

  def new
    url = request.original_url
    uri    = URI.parse(url)
    if uri.query.present?
       request_params = CGI.parse(uri.query)
       @company = request_params['company'].first
    end
    @manager = Manager.new
  end

  def create
    url = request.referer
    uri    = URI.parse(url)
    if uri.query.present?
       request_params = CGI.parse(uri.query)
       @company = request_params['company'].first

       study_id = request_params['id'].first.to_i
       @manager = Manager.new manager_params
       @manager.study = Study.find study_id
    end




    if @manager.save
      session[:user_id] = @manager.id
      redirect_to root_path, notice: 'Thank you for signing up'
    else
      render :new
    end
  end

  def show

  end



  private

  def find_manager
    @manager = Manager.find params[:id]
  end

  def parse_url(url)

      uri    = URI.parse(url)
    if uri.query.present?
       request_params = CGI.parse(uri.query)
       @company = request_params['company'].first
       study_id = request_params['id'].first.to_i
    end
  end

  def manager_params
    params.require(:manager).permit([:first_name,
                                        :last_name,
                                        :email,
                                        :password,
                                        :password_confirmation])
  end

end
