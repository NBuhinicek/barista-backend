class CoffeeShop < ApplicationRecord
  has_one :user, dependent: :destroy
  has_one :location, dependent: :destroy

  def useable?
    Time.current < paid_till
  end
end
