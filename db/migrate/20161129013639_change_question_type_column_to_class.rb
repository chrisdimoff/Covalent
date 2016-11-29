class ChangeQuestionTypeColumnToClass < ActiveRecord::Migration[5.0]
  def change
    remove_column :questions, :type, :string
    add_column :questions, :kind, :string
  end
end
