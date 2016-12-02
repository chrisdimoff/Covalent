class DownloadsController < ApplicationController
  before_action :find_participant, only:[:ind_participant]

  def ind_participant



    @entries = @participant.entries

    respond_to do |format|
    format.html # don't forget if you pass html
    format.xlsx {
      response.headers['Content-Disposition'] = "attachment; filename='#{@participant.full_name}.xlsx'"
    }
    end
  end

  private
  def find_participant
    @participant = User.find params[:id]
  end
end
