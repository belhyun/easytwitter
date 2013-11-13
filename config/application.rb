require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Mifd
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    Twitter.configure do |config|
      config.consumer_key        = "2wfjnSrPWPSTdqZVlWYyJg"
      config.consumer_secret     = "k5iqKtaLyZlnOcVJKg5VrdSTOBPYY55ta6nvRoClo"
      config.oauth_token        = "177910822-Gb1OhQPvC4YRAgU8CYSuu8grboYIelEuqIAM7jup"
      config.oauth_token_secret = "NcgGmYOp3v9tKVOcG8Jw9ODeleWKn9yMt7Ac6k5YI1Qcv"
    end
  end
end
