class Order < ApplicationRecord
  has_many :coffee_shop_items, dependent: :nullify
  validates :user, presence: true
  validates :coffee_shop, presence: true,
                          numericality: { only_integer: true }
  validates :table_number, presence: true

  monetize :total_price_cents
  monetize :discount_price_cents

  enumeration :payment_type,
              foreign_key: :payment_type,
              class_name: PaymentType
end
