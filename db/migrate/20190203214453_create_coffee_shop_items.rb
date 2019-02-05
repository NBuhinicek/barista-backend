class CreateCoffeeShopItems < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_shop_items do |t|
      t.string :name
      t.string :item_type

      t.timestamps
    end
  end
end
