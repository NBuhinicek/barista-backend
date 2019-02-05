class CoffeeShop < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :coffee_tables, dependent: :destroy

  # TODO: will need better methods for validity
  def useable?
    Time.current < paid_till
  end
end
