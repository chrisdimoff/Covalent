class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :body
      t.string :type
      t.references :manager_survey, foreign_key: true
      t.json     :matrix_headings,    default: []


      t.timestamps
    end
  end
end
