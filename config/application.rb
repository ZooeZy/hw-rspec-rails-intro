
require File.expand_path('boot', __dir__)

# Pick the frameworks you want:
# require "active_record/railtie"
# require "action_controller/railtie"
# require "action_mailer/railtie"
# require "active_resource/railtie"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

require "rails/all"

Bundler.require(:default, Rails.env)

module Rottenpotatoes
  class Application < Rails::Application

    # Settings in config/environments/* take precedence over
    # those specified here.

    # Application configuration should go into files in
    # config/initializers, which are loaded automatically.

    # Custom directories with classes and modules
    # you want to be autoloadable.
    # config.autoload_paths += %W(#{config.root}/extras)

    # Only load the plugins named here, in the order given.
    # config.plugins = [
    #   :exception_notification,
    #   :ssl_requirement,
    #   :all
    # ]

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher

    # Set Time.zone default.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en.
    # config.i18n.default_locale = :de

    # Default encoding
    config.encoding = "utf-8"

    # Filter sensitive parameters from logs
    config.filter_parameters += [:password, :api_key, :token]

    # Asset pipeline version
    config.assets.version = '1.0'

    # Escape HTML entities in JSON
    config.active_support.escape_html_entities_in_json = true

    # Optional SQL schema format
    # config.active_record.schema_format = :sql

    # Cache format compatible with Rails 7.1
    config.active_support.cache_format_version = 7.1

  end
end
