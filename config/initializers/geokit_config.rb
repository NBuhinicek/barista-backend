# Google Api Key
google_api_key = Rails.application.credentials[Rails.env.to_sym][:google_api_key]
Geokit::Geocoders::GoogleGeocoder.api_key = google_api_key
