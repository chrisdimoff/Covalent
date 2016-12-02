class AddReviewedPersonColumnToEntries < ActiveRecord::Migration[5.0]
  def change
    add_reference :entries, :target_person, index: true, foreign_key: {to_table: :users}
  end
end
