class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.references :employee, foreign_key: {to_table: :users}
      t.references :manager, foreign_key: {to_table: :users}
      t.references :study, foreign_key: true
      t.json :entry, default: []

      t.timestamps
    end
  end
end
