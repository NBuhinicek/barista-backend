class OrderItem < ApplicationRecord
  validates :name, presence: true
end
