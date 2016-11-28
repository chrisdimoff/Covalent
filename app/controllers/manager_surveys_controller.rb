class ManagerSurveysController < ApplicationController
  def new
    @manager_survey = ManagerSurvey.new()
    
  end
end
