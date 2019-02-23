ruby '2.5.1'

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'aws-sdk-s3', '~> 1.2'
gem 'barby'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2'
gem 'country_select'
gem 'devise'
gem 'enumerations'
gem 'fast_jsonapi'
gem 'geokit'
gem 'jbuilder', '~> 2.5'
gem 'json_api_responders'
gem 'money-rails'
gem 'pg', '>= 0.18', '< 2.0'
gem 'pry-rails'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.2'
gem 'rqrcode'
gem 'sass-rails', '~> 5.0'
gem 'shrine'
gem 'simple_form'
gem 'slim'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'rspec-rails', '~> 3.7'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'overcommit', require: false
  gem 'rubocop', '~> 0.58.0', require: false
  gem 'rubocop-rspec', '~> 1.27.0', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
