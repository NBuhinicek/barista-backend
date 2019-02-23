class Location < ApplicationRecord
  has_one :coffee_shop, dependent: :destroy

  validates :street, presence: true
  validates :zip_code, presence: true,
                       numericality: { only_integer: true }
  validates :country, presence: true

  def location_address
    "#{street}, #{zip_code}"
  end
end
