class CreateManagerParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :manager_participations do |t|
      t.references :manager, foreign_key: {to_table: :users}
      t.references :study, foreign_key: true

      t.timestamps
    end
  end
end
