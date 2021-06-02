# Just use the production settings
require File.expand_path('../production.rb', __FILE__)

Rails.application.configure do

  host = ENV['DOMAIN_URL']

  # Here override any defaults
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'herokuapp.com',
    user_name:            'resume.znpp@gmail.com',
    password:             '!1Qwerty',
    authentication:       'plain' }

  config.action_mailer.preview_path = "#{Rails.root}/test/mailers/previews"
  config.action_mailer.asset_host = "http://#{host}"
  config.action_mailer.default_url_options = { host: host }

  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.perform_caching = false
end
