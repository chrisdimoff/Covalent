class ManagerSurveysController < ApplicationController
  def new
    @study = Study.find(params[:study_id])
    @manager_survey = ManagerSurvey.new()

  end

  def create
    survey_params = params.require(:manager_survey)
                        .permit([ :form_name,
                                  :id,
                                  :_destroy,
                                  { mc_questions_attributes:
                                                      [:body, :manager_survey_id] }])

    byebug



      study_id = params.permit(:study_id)['study_id'].to_i
      study = Study.find study_id
      @manager_survey = ManagerSurvey.new survey_params
      @manager_survey.study = study
      # @manager_survey.mc_questions.map {|mc| mc.update_attributes(manager_survey_id: @manager_survey)}

      if @manager_survey.save
        redirect_to study_path(params[:study_id]), notice: "Survey created"
      else
        puts @manager_survey.errors.full_messages
        render :new
      end
  end
end
