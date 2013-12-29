Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter , APP_CONFIG['twitter_key'], APP_CONFIG['twitter_secret']
end
