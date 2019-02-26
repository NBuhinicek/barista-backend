class LocationSerializer < BaseSerializer
  attributes :coordinates

  attribute :address, &:location_address

  attribute :coffee_shop_name do |object|
    object.coffee_shop.name
  end

  attribute :distance do |object, params|
    DistanceMeasurer.new(params[:current_location], object.coordinates).call
  end

  attribute :image_url do |object|
    object.coffee_shop.image&.url
  end
end
