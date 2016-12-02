class StudiesController < ApplicationController
  before_action :find_study, only: [:show]
  def index
    @studies = current_user.studies
  end

  def new
    @study = Study.new
  end

  def show
    @manager = Manager.last

    @managers_signed_up = @study.managers.count
    @employees_signed_up = @study.employees.count
    @managers_not_signed_up = @study.num_of_managers - @managers_signed_up

  end

  def create
    @study = Study.new study_params
    @study.researcher = current_user
    @study.status = "Pending"

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
end
