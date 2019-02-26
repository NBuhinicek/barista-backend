# Google Api Key
google_api_key = Rails.application.credentials[:google_api_key]
Geokit::Geocoders::GoogleGeocoder.api_key = google_api_key
Geokit.default_units = :meters
