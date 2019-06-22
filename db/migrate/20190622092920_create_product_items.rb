class CreateProductItems < ActiveRecord::Migration[5.2]
  def change
    create_table :product_items do |t|
      t.string :color
      t.integer :product_id
      t.integer :price

      t.timestamps
    end
  end
end
