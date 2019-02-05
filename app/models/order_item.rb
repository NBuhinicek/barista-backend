class OrderItem < ApplicationRecord
  validates :name, presence: true
  validates :item_type, presence: true

  enumeration :item_type,
              foreign_key: :item_type,
              class_name: ItemType
end
