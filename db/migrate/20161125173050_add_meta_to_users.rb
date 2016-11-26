class AddMetaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :meta_id, :integer
    add_column :users, :meta_type, :string
  end
end
