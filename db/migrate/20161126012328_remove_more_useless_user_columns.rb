class RemoveMoreUselessUserColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :users,  :meta_id
    remove_column :users, :meta_type
  end
end
