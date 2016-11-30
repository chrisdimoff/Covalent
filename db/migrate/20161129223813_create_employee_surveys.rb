class CreateEmployeeSurveys < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_surveys do |t|
      t.string :form_name
      t.references :study, foreign_key: true

      t.timestamps
    end
  end
end
