class ManagerEntriesController < ApplicationController
  def new
    @manager = Manager.find params[:manager_id]

    @entry = Entry.new()

    @survey = @manager.study.manager_surveys.last
  end

  def create
    @manager = Manager.find params[:manager_id]
    entry_params = params.permit('data').tap do |whitelisted|
        whitelisted['data'] = params['data']
    end

    @survey = @manager.study.manager_surveys.last

    @study = @manager.study

    @entry = Entry.new(content: entry_params, study: @study, manager: @manager, manager_survey: @survey)
    @entry.content['form_name'] = @survey.form_name


    if @entry.save
      redirect_to new_manager_manager_entry_path(@manager), notice: "Survey Response Received!"
    else
      render :new
    end
  end


end
