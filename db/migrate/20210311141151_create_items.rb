class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :product
      t.string :image_id
      t.integer :price
      t.boolean :is_selling
      t.text :product_explain

      t.timestamps
    end
  end
end
