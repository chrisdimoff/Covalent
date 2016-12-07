class AddActiveColumnToManagerSurveys < ActiveRecord::Migration[5.0]
  def change
    add_column :manager_surveys, :active, :boolean, default: false
  end
end
