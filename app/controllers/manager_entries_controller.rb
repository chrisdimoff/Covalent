class ManagerEntriesController < ApplicationController
  def new
    @manager = Manager.find params[:manager_id]

    @entry = Entry.new()

    @survey = @manager.study.manager_survey
  end

  def create
    @manager = Manager.find params[:manager_id]
    entry_params = params.permit('data').tap do |whitelisted|
        whitelisted['data'] = params['data']

    end

    @study = @manager.study

    @entry = Entry.new(content: entry_params, study: @study, manager: @manager)

    if @entry.save
      redirect_to new_manager_manager_entry_path(@manager), notice: "Survey Response Received!"
    else
      puts @entry.errors.full_messages
      render :new
    end
  end


end
