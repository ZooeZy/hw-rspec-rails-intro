
Rottenpotatoes::Application.configure do

  # Settings specified here take precedence over
  # those in config/application.rb.

  # Code is not reloaded between requests
  config.cache_classes = true

  # Disable detailed error reports and enable caching
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true

  # Load application code on boot
  config.eager_load = true

  # Allow Rails to serve precompiled static assets on Heroku
  config.public_file_server.enabled =
    ENV['RAILS_SERVE_STATIC_FILES'].present?

  # Compress JavaScript and CSS assets
  config.assets.js_compressor = nil

  # Fallback to asset pipeline if necessary
  config.assets.compile = true

  # Generate digests for asset URLs
  config.assets.digest = true

  # Optional additional precompiled assets
  # config.assets.precompile += %w( search.js )

  # File delivery configuration
  # config.action_dispatch.x_sendfile_header = "X-Sendfile"
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect'

  # SSL configuration
  # config.force_ssl = true

  # Production logging
  config.log_level = :info

  if ENV['RAILS_LOG_TO_STDOUT'].present?
    config.logger = ActiveSupport::Logger.new($stdout)
  end

  # Optional cache store
  # config.cache_store = :mem_cache_store

  # Optional asset host
  # config.action_controller.asset_host = "http://assets.example.com"

  # Ignore email delivery errors if configured
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

end
