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

    # # logic to count managers for chart
    # @managers_signed_up_active = 0
    # @study.managers.each do |mgr|
    #   num_of_entries = mgr.entries.where(study_id: @study.id).count
    #   if  num_of_entries > 0
    #
    #     @managers_signed_up_active += 1
    #   end
    # end
    # @managers_signed_up = @study.managers.count
    # @managers_not_signed_up = @study.num_of_managers - @managers_signed_up
    # @managers_signed_up_inactive = @managers_signed_up - @managers_signed_up_active
    # # ######

    # logic to count managers for chart
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
    # ######

    # logic to count employees for chart
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
    # #####
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
