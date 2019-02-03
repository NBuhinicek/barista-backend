class Location < ApplicationRecord
  validates :street, presence: true
  validates :street_number, presence: true
  validates :zip_code, presence: true,
                       numericality: { only_integer: true }
  validates :country, presence: true
  validates :coordinates, presence: true
end
