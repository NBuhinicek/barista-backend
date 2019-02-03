class CreateCoffeeShopItems < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_shop_items do |t|
      t.belongs_to :coffee_shop
      t.belongs_to :order_items
      t.monetize :price, null: false
      t.boolean :available, default: true
      t.boolean :special_deal, default: false

      t.timestamps
    end
  end
end
