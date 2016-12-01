class AddSurveyReferencesToEntries < ActiveRecord::Migration[5.0]
  def change
    add_reference :entries, :employee_survey, index: true, foreign_key: true
    add_reference :entries, :manager_survey, index: true, foreign_key: true
  end
end
