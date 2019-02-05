class CoffeeShop < ApplicationRecord
  has_one :user, dependent: :destroy
  has_one :location, dependent: :destroy
  has_many :coffee_tables, dependent: :destroy

  # TODO: will need better methods for validity
  def useable?
    Time.current < paid_till
  end
end
