class CoffeeShopItem < ApplicationRecord
  validates :coffee_shop, presence: true
  validates :order_items, presence: true
  validates :price, presence: true

  monetize :price_cents
end
