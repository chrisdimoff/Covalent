class LinksController < ApplicationController

  def manager

    @study = Study.find params[:study]
    respond_to do |format|
      format.html
      format.js {render :manager}
    end
  end

  def employee
  end
end
