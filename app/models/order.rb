class Order < ApplicationRecord
  has_many :coffee_shop_items, dependent: :nullify
  validates :user, presence: true
  validates :coffee_shop, presence: true
  validates :coffee_table, presence: true

  monetize :total_price_cents
  monetize :discount_price_cents
end
