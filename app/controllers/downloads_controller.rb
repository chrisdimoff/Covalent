class DownloadsController < ApplicationController
  before_action :find_participant, only:[:ind_participant]
  before_action :find_manager, only: [:ind_manager_download]

  def ind_participant
    @entries = @participant.entries

    respond_to do |format|
    format.html # don't forget if you pass html
    format.xlsx {
      response.headers['Content-Disposition'] = "attachment; filename='#{@participant.full_name}.xlsx'"
    }
    end
  end

  def ind_manager_download
    @study = @manager.study
    @surveys = @study.manager_surveys
    respond_to do |format|
    format.html # don't forget if you pass html
    format.xlsx {
      response.headers['Content-Disposition'] = "attachment; filename='#{@manager.full_name}.xlsx'"
    }
    end
  end

  private
  def find_participant
    @participant = User.find params[:id]
  end

  def find_manager
    @manager = User.find params[:id]
  end
end
