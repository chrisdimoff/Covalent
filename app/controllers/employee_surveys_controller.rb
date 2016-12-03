class EmployeeSurveysController < ApplicationController

  def new
    @study = Study.find(params[:study_id])
    @employee_survey = EmployeeSurvey.new()
    @survey_number = @study.employee_surveys.count + 1

  end

  def create
    survey_params = params.require(:employee_survey)
        .permit([ :form_name,
                  :id,
                  :_destroy,
                  { questions_attributes:
                                      [:body,
                                       :kind,
                                       :employee_survey_id,
                                       :matrix_headings,
                                       {options_attributes: [:content, :id, :num_of_selections, :_destroy]}

                                       ] }])


      study_id = params.permit(:study_id)['study_id'].to_i
      study = Study.find study_id


      @employee_survey = EmployeeSurvey.new survey_params
      @employee_survey.study = study
      # @employee_survey.mc_questions.map {|mc| mc.update_attributes(employee_survey_id: @employee_survey)}

      if @employee_survey.save
        redirect_to study_path(params[:study_id]), notice: "Survey created"
      else
        puts @employee_survey.errors.full_messages
        render :new
      end
  end

  def show
    @employee_survey = EmployeeSurvey.find params[:id]
  end
end
