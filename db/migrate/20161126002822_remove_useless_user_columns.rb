class RemoveUselessUserColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :users,  :researcher, :boolean
    remove_column :users, :manager, :boolean
  end
end
