class DistanceMeasurer
  def initialize(location, target)
    @location = location_latlng(location)
    @target = location_latlng(target)
  end

  def call
    @location.distance_to(@target)
  end

  private

  def location_latlng(ll_string)
    coordinates = ll_string.split(',')
    Geokit::LatLng.new(coordinates[0], coordinates[1])
  end
end
