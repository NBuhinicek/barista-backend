class OrderItem < ApplicationRecord
  has_one :user, dependent: :nullify
  has_one :order, dependent: :nullify
  has_one :coffee_shop_item, dependent: :nullify

  validates :quantity, presence: true

  monetize :price_cents
end
