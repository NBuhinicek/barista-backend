class CoordinatesFinder
  def initialize(street, street_number, zip_code)
    @street = street
    @street_number = street_number
    @zip_code = zip_code
  end

  def call
    coordinates.ll
  end

  private

  def coordinates
    Geokit::Geocoders::GoogleGeocoder.geocode(location_address)
  end

  def location_address
    "#{@street} #{@street_number}, #{@zip_code}"
  end
end
