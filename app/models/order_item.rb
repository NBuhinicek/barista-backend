class OrderItem < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :coffee_shop_item

  validates :quantity, presence: true

  monetize :price_cents
end
