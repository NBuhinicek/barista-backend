class CoffeeShop < ApplicationRecord
  has_one :user, dependent: :destroy
  has_one :location, dependent: :destroy
  has_many :coffee_tables, dependent: :destroy

  def useable?
    Time.current < paid_till
  end
end
