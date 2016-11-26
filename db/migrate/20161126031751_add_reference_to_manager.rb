class AddReferenceToManager < ActiveRecord::Migration[5.0]
  def change
    add_reference :managers, :study_id, foreign_key: true
  end
end
