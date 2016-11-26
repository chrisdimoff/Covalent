class CreateParticipations < ActiveRecord::Migration[5.0]
  def change
    drop_table :participations
    create_table :participations do |t|
      t.references :manager, foreign_key: {to_table: :users}
      t.references :study, foreign_key: true

      t.timestamps
    end
  end
end
