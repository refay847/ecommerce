class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :total_amount, precision: 10, scale: 2
      t.string :status, default: "pending"
      t.text :shipping_address
      t.string :phone_number

      t.timestamps
    end
  end
end
