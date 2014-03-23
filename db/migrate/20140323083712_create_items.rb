class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :start_price, precision: 8, scale: 2
      t.datetime :end_date
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
  
  def down
    drop_table :items
  end
end
