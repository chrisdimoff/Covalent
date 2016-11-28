class LinksController < ApplicationController

  def manager

    @study = Study.find params[:study]
    respond_to do |format|
      format.html
      format.js {render :manager}
    end
  end

  def employee

    @study = Study.find params[:study]
    respond_to do |format|
      format.html
      format.js {render :employee}
    end
  end
end
