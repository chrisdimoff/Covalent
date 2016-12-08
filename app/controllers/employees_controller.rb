class EmployeesController < ApplicationController
  def show
    @employee = Employee.find params[:id]
  end

  def new
    url = request.original_url
    uri    = URI.parse(url)
    if uri.query.present?
       request_params = CGI.parse(uri.query)
       study_id = request_params['id'].first.to_i
       study = Study.find study_id
       @managers = study.managers
       @company = request_params['company'].first
    end
    @employee = Employee.new
  end

  def create
    url = request.referer
    uri    = URI.parse(url)
    if uri.query.present?
       request_params = CGI.parse(uri.query)
       study_id = request_params['id'].first.to_i
       @company = request_params['company'].first
       manager_params = params.permit(:manager)

       manager_id = manager_params['manager'].to_i

       @manager = Manager.find manager_id

    end


    employee_params = params.permit([:first_name,
                                        :last_name,
                                        :email,
                                        :password,
                                        :password_confirmation])



    @employee = Employee.new employee_params
    @employee.manager = @manager

    @employee.study = Study.find study_id

    if @employee.save
      session[:user_id] = @employee.id
      # redirect_to root_path, notice: 'Thank you for signing up'
      redirect_to new_employee_employee_entry_path(@employee), notice: 'Thank you for signing up'
    else
      render :new
    end
  end

  private

  def employee_params

      params.require(:employee).permit([:first_name,
                                          :last_name,
                                          :email,
                                          :password,
                                          :password_confirmation,
                                          :manager]
                                          )
  end


end
