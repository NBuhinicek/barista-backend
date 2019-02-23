class CoordinatesFinder
  def initialize(location)
    @location = location
  end

  def call
    coordinates.ll
  end

  private

  def coordinates
    Geokit::Geocoders::GoogleGeocoder.geocode(@location.location_address)
  end
end
