class CreateChilderns < ActiveRecord::Migration
  def change
    create_table :childerns do |t|
      t.string :email_id

      t.timestamps null: false
    end
  end
end
