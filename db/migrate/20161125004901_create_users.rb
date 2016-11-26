class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :researcher
      t.boolean :manager
      t.string :uid
      t.string :provider
      t.string :oauth_token
      t.string :oauth_secret
      t.text :oauth_raw_data

      t.timestamps
    end
  end
end
