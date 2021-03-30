class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false
      t.string :product, null: false
      t.string :image_id, null: false
      t.integer :price, null: false
      t.boolean :is_selling, null: false, default: false
      t.text :product_explain, null: false

      t.timestamps
    end
  end
end
