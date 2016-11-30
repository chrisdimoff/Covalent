class AddReferencesToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_reference :questions, :employee_survey, index: true, foreign_key: true
  end
end
