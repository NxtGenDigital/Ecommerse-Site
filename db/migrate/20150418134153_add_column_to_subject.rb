class AddColumnToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :book_id, :integer
  end
end
