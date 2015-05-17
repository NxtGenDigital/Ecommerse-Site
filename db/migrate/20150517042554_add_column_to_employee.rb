class AddColumnToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :junior_id, :integer
  end
end
