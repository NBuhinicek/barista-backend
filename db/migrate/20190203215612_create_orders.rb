class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :coffee_shop
      t.integer :table_number
      t.boolean :finished
      t.date :finished_at
      t.monetize :total_price
      t.monetize :discount_price
      t.string :payment_type

      t.timestamps
    end
  end
end
