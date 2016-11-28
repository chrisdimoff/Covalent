class EmployeesController < ApplicationController
  def show
    @employee = Employee.find params[:id]
  end

  def new
    @employee = Employee.new
  end

  private


end
