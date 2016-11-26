class CreateLeadings < ActiveRecord::Migration[5.0]
  def change
    create_table :leadings do |t|
      t.references :manager, foreign_key: {to_table: :users}
      t.references :employee, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
