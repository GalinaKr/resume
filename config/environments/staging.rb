# Just use the production settings
require File.expand_path('../production.rb', __FILE__)

Rails.application.configure do
  # Here override any defaults

  host = ENV['DOMAIN_URL']

  # Setup copy/pasted from https://heroku.mailtrap.io/inboxes/1136108/messages
  # Click on My Inbox, SMTP Settings, then select RoR from Integrations
  #config.action_mailer.delivery_method = :smtp
  #config.action_mailer.smtp_settings = {
  #  user_name: ENV['SMTP_USER_NAME'],
  #  password: ENV['SMTP_PASSWORD'],
  #  address: ENV['SMTP_ADDRESS'],
  #  domain: ENV['SMTP_DOMAIN'],
  #  port: ENV['SMTP_PORT'],
  #  authentication: ENV['SMTP_AUTHENTICATION'].to_sym
  #}
  #
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_options = { from: 'resume.znpp@gmail.com' }
  config.action_mailer.default_url_options = { :host => 'staging-resume-znpp.herokuapp.com' }
  config.action_mailer.smtp_settings = {
    :address        => 'smtp.gmail.com',
    :domain         => 'heroku.com',
    :port           => 587,
    :user_name      => ENV['SMTP_ADDRESS'],
    :password       => ENV['SMTP_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
  config.action_mailer.raise_delivery_errors = true

  # Allow mailer previews to occur on the staging server:
  # https://stackoverflow.com/questions/27453578/rails-4-email-preview-in-production
  #config.action_mailer.show_previews = true

  #config.action_mailer.asset_host = "https://#{host}"
  #config.action_mailer.default_url_options = { host: host }
  #config.action_mailer.default_url_options = { protocol: 'https', host: ENV['DOMAIN_URL'] }
  #config.action_mailer.raise_delivery_errors = true
  #config.action_mailer.perform_caching = true
end
