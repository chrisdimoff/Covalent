class ManagerEntriesController < ApplicationController
  def new
    @manager = Manager.find params[:manager_id]

    @survey = @manager.study.manager_surveys.last
  end

  def create
    @manager = Manager.find params[:manager_id]
    entry_params = params.permit('data').tap do |whitelisted|
        whitelisted['data'] = params['data']
    end


    @study = @manager.study
    @survey = @study.manager_surveys.last


    @entry = Entry.new(content: entry_params, study: @study, manager: @manager, manager_survey: @survey)
    @entry.content['form_name'] = @survey.form_name

    if params[:target_person_id]
      target_person = User.find params[:target_person_id]
      @entry.target_person = target_person
    end

    if @entry.save
      # redirect_to new_manager_manager_entry_path(@manager), notice: "Survey Response Received!"
      # render :new
    else
      puts @entry.errors.full_messages
      render :new
    end
  end


end
