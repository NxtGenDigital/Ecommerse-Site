class AddColumnToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :parent_id, :integer
  end
end
