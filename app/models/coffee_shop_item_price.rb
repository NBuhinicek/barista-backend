class CoffeeShopItemPrice < ApplicationRecord
  belongs_to :coffee_shop
  belongs_to :coffee_shop_item

  validates :coffee_shop, presence: true
  validates :coffee_shop_item, presence: true
  validates :price, presence: true
  validates :available, presence: true

  monetize :price_cents
end
