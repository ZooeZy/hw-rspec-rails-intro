
source 'https://rubygems.org'

ruby '3.3.8'

gem 'rails', '~>7.1.5'
gem 'ffi', '1.14.2'

gem 'sass-rails', '~> 5.0.3'
gem 'uglifier', '>= 2.7.1'

gem 'jquery-rails'
gem 'bigdecimal', '1.3.5'

# Used to make HTTP requests to TMDb
gem 'faraday', '1.8.0'

# Keep JSON compatible with Rails ActiveSupport
gem 'json', '>= 2.21.2', '< 3.0'

# Development-only tools
group :development do
  gem 'web-console', '~> 4'
end

# Development and testing dependencies
group :development, :test do
  gem 'byebug'
  gem 'database_cleaner'
  gem 'cucumber-rails', require: false
  gem 'rspec-rails'
  gem 'pry'
  gem 'pry-byebug'

  # Use SQLite3 for development and testing
  gem 'sqlite3', '~> 1.7'
end

# Additional gems for RSpec, Guard, and WebMock
group :test do
  gem 'rails-controller-testing'
  gem 'guard-rspec'
  gem 'webmock'
end

# Production dependencies for Heroku
group :production do
  gem 'pg', '~> 1.6'
  gem 'puma', '~> 7.0'
end
