class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.decimal :price, precision: 8, scale: 2
      t.integer :category_id
      t.integer :inventory
    end
  end
end
