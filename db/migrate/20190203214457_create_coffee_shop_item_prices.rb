class CreateCoffeeShopItemPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_shop_item_prices do |t|
      t.belongs_to :coffee_shop
      t.belongs_to :coffee_shop_item
      t.monetize :price, null: false
      t.boolean :available, default: true
      t.boolean :special_deal, default: false

      t.timestamps
    end
  end
end
