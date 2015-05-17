class AddColumnToParent < ActiveRecord::Migration
  def change
    add_column :parents, :childern_id, :integer
  end
end
