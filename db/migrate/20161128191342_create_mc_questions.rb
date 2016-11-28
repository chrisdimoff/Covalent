class CreateMcQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :mc_questions do |t|
      t.string :name
      t.references :manager_survey, foreign_key: true

      t.timestamps
    end
  end
end
