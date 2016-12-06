class StudiesController < ApplicationController
  before_action :find_study, only: [:show]
  before_action :authenticate_user
  before_action :authorize_access, only: [:show, :destroy]
  def index
    @studies = current_user.studies

    
  end

  def new
    @study = Study.new
  end

  def show
    @manager = Manager.last

    if @study.num_of_managers
      @inactive_managers = []
      @study.managers.each do |mgr|
        num_of_entries = mgr.entries.where(study_id: @study.id).count
        if  num_of_entries == 0

          @inactive_managers.push(mgr)
        end
      end
      @managers_signed_up = @study.managers.count
      @managers_not_signed_up = @study.num_of_managers - @managers_signed_up
      @managers_signed_up_inactive = @inactive_managers.count
      @managers_signed_up_active = @managers_signed_up - @inactive_managers.count
    end
    # ######

    # logic to count employees for chart
    if @study.num_of_employees
      @employees_signed_up_active = 0
      @study.employees.each do |emp|
        num_of_entries = emp.entries.where(study_id: @study.id).count
        if  num_of_entries > 0

          @employees_signed_up_active += 1
        end
      end
      @employees_signed_up = @study.employees.count
      @employees_not_signed_up = @study.num_of_employees - @employees_signed_up
      @employees_signed_up_inactive = @employees_signed_up - @employees_signed_up_active
    end
    # #####
  end

  def create
    @study = Study.new study_params
    @study.status = "Pending"

      @study.researcher = current_user
      if @study.save
        redirect_to study_path(@study), notice: "Study Created!"
      else
        render :new, alert: "Please see errors below"
      end

  end


  def destroy
  end

  private

  def find_study
    @study = Study.find params[:id]
  end

  def study_params
    study_params = params.require(:study).permit(:title, :num_of_managers, :num_of_employees, :company)
  end

  def authorize_access
    unless can? :manage, @study
      # head :unauthorized # this will send an empty HTTP response with 401 code
      redirect_to root_path, alert: 'access denied'
    end
  end
end
