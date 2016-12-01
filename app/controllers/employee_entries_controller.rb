
  class EmployeeEntriesController < ApplicationController
    def new
      @employee = Employee.find params[:employee_id]

      @entry = Entry.new()

      @survey = @employee.study.employee_surveys.last
    end

    def create
      @employee = Employee.find params[:employee_id]
      entry_params = params.permit('data').tap do |whitelisted|
          whitelisted['data'] = params['data']
      end

      @study = @employee.study
      @survey =@employee.study.employee_surveys.last

      @entry = Entry.new(content: entry_params, study: @study, employee: @employee, employee_survey: @survey)

      if @entry.save
        redirect_to new_employee_employee_entry_path(@employee), notice: "Survey Response Received!"
      else
        puts @entry.errors.full_messages
        render :new
      end
    end


  end
