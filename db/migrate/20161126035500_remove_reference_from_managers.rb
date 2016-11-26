class RemoveReferenceFromManagers < ActiveRecord::Migration[5.0]
  def change
    remove_column(:managers, :study_id)
  end
end
