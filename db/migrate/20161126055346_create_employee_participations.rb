class CreateEmployeeParticipations < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_participations do |t|
      t.references :employee, foreign_key: {to_table: :users}
      t.references :study, foreign_key: true

      t.timestamps
    end
  end
end
