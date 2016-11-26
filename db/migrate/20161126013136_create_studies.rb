class CreateStudies < ActiveRecord::Migration[5.0]
  def change
    create_table :studies do |t|
      t.string :title
      t.string :status
      t.integer :num_of_managers
      t.integer :num_of_employees

      t.references :researcher, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
