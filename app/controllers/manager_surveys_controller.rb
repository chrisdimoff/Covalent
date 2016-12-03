class ManagerSurveysController < ApplicationController
  def new
    @study = Study.find(params[:study_id])
    @manager_survey = ManagerSurvey.new()
    @survey_number = @study.manager_surveys.count + 1

  end

  def create
    survey_params = params.require(:manager_survey)
        .permit([ :form_name,
                  :id,
                  :_destroy,
                  { questions_attributes:
                                      [:body,
                                       :kind,
                                       :manager_survey_id,
                                       :matrix_headings,
                                       {options_attributes: [:content, :id, :num_of_selections, :_destroy]}

                                       ] }])


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

  def show
    @manager_survey = ManagerSurvey.find params[:id]

  end
end
