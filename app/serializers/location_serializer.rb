class LocationSerializer < BaseSerializer
  attributes :coordinates

  attribute :address do |object|
    object.location_address
  end

  attribute :coffee_shop_name do |object|
    object.coffee_shop.name
  end
end
