class CreateResponses < ActiveRecord::Migration[5.0]
  def change
    create_table :responses do |t|
      t.references :question, foreign_key: true

      t.text :content
      t.timestamps
    end
  end
end
