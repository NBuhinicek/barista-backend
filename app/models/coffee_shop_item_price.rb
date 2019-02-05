class CoffeeShopItemPrice < ApplicationRecord
  has_one :coffee_shop, dependent: :nullify
  has_one :coffee_shop_item, dependent: :nullify

  validates :coffee_shop, presence: true
  validates :coffee_shop_item, presence: true
  validates :price, presence: true
  validates :available, presence: true

  monetize :price_cents
end
