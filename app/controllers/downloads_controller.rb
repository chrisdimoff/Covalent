class DownloadsController < ApplicationController
  before_action :find_manager, only:[:ind_manager]

  def ind_manager

    @entry = Entry.find_by_manager_id( @manager.id )
    @entry_number = @manager.entries.count

    respond_to do |format|
    format.html # don't forget if you pass html
    format.xlsx {response.headers['Content-Disposition'] = "attachment; filename='#{@manager.full_name}.xlsx'"}

    end
  end

  private
  def find_manager
    @manager = Manager.find params[:id]
  end
end
