class LocationSerializer < BaseSerializer
  has_one :coffee_shop

  attributes :coordinates

  attribute :address do |object|
    "#{object.street} #{object.street_number}, #{object.county}"
  end
end
