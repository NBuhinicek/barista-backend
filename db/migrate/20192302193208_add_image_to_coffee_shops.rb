class AddImageToCoffeeShops < ActiveRecord::Migration[5.2]
  def up
    add_column :coffee_shops, :image_data, :string
  end

  def down
    remove_column :coffee_shops, :image_data
  end
end
