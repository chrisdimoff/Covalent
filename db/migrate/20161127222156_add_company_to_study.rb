class AddCompanyToStudy < ActiveRecord::Migration[5.0]
  def change
    add_column :studies, :company, :string
  end
end
