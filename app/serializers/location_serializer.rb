class LocationSerializer < BaseSerializer
  attributes :coordinates

  attribute :address do |object|
    "#{object.street} #{object.street_number}, #{object.county}"
  end

  attribute :coffee_shop_name do |object|
    object.coffee_shop.name
  end
end
