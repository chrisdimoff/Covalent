
  class EmployeeEntriesController < ApplicationController
    def new
      @employee = Employee.find params[:employee_id]

      # @entry = Entry.new()

      # @survey = @employee.study.employee_surveys.last
      @survey = @employee.study.employee_surveys.where(active: true).first
    end

    def create
      @employee = Employee.find params[:employee_id]
      entry_params = params.permit('data').tap do |whitelisted|
          whitelisted['data'] = params['data']
      end

      @study = @employee.study
      # @survey = @employee.study.employee_surveys.last
      @survey = @employee.study.employee_surveys.where(active: true).first

      @entry = Entry.new(content: entry_params, study: @study, employee: @employee, employee_survey: @survey)
      @entry.content['form_name'] = @survey.form_name


      if params[:target_person_id]
        target_person = User.find params[:target_person_id]
        @entry.target_person = target_person
      end

      if @entry.save
        redirect_to root_path, notice: "Survey Response Received!"
      else
        puts @entry.errors.full_messages
        render :new
      end
    end


  end
