class AddNumberOfRadiosToOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :options, :num_of_selections, :integer
  end
end
