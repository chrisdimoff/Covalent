class DownloadsController < ApplicationController
  before_action :find_participant, only:[:ind_participant]
  before_action :find_manager, only: [:ind_manager]

  def ind_participant
    @entries = @participant.entries

    respond_to do |format|
    format.html # don't forget if you pass html
    format.xlsx {
      response.headers['Content-Disposition'] = "attachment; filename='#{@participant.full_name}.xlsx'"
    }
    end
  end

  def ind_manager
    @study = @manager.study
    @surveys = @study.manager_surveys
    respond_to do |format|
    format.html # don't forget if you pass html
    format.xlsx {
      response.headers['Content-Disposition'] = "attachment; filename='#{@manager.full_name}.xlsx'"
    }
    end
  end

  def all_managers
    @study = Study.find params[:study_id]
    @surveys = @study.manager_surveys
    @managers = @study.managers
    respond_to do |format|
    format.html # don't forget if you pass html
    format.xlsx {
      response.headers['Content-Disposition'] = "attachment; filename='#{@study.title}--Managers.xlsx'"
    }
    end
  end
  def all_employees
    @study = Study.find params[:study_id]
    @surveys = @study.employee_surveys
    @employees = @study.employees
    respond_to do |format|
    format.html # don't forget if you pass html
    format.xlsx {
      response.headers['Content-Disposition'] = "attachment; filename='#{@study.title}--Employees.xlsx'"
    }
    end
  end

  private
  def find_participant
    @participant = User.find params[:id]
  end

  def find_manager
    @manager = User.find params[:manager_id]
  end


end
