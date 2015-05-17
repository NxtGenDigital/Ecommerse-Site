class RemoveColumnToBook < ActiveRecord::Migration
  def change
    remove_column :books, :subject_id, :string
  end
end
