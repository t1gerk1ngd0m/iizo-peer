Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :slack, ENV['SLACK_API_KEY'], ENV['SLACK_API_SECRET'], scope: 'identity.basic'
  { provider_ignores_state: true }
end
