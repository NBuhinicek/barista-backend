class AddApprovedToCoffeeShops < ActiveRecord::Migration[5.2]
  def up
    add_column :coffee_shops, :approved, :boolean, default: false
  end

  def down
    remove_column :users, :approved
  end
end
