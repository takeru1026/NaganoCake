class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id, null: false
      t.integer :terms_payment, null: false
      t.string :address, null: false
      t.integer :postage, null: false
      t.string :postcode, null: false
      t.integer :amount_claimed, null: false
      t.integer :status, null: false
      t.string :addresser, null: false

      t.timestamps
    end
  end
end
