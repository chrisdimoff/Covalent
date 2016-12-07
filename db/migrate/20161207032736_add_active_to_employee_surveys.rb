class AddActiveToEmployeeSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :employee_surveys, :active, :boolean, default: false
  end
end
