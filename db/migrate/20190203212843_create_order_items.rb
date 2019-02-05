class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.belongs_to :user
      t.belongs_to :order
      t.belongs_to :coffee_shop_item

      t.integer :quantity

      t.monetize :price

      t.timestamps
    end
  end
end
