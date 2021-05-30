# Just use the production settings
require File.expand_path('../production.rb', __FILE__)

Rails.application.configure do
  # Here override any defaults
  config.app_domain = 'staging-resume-znpp.herokuapp.com'

  # Email
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.default_url_options = { host: config.app_domain }
  config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: '587',
    enable_starttls_auto: true,
    user_name: 'resume.znpp@gmail.com',
    password: '!1Qwerty',
    authentication: :plain,
    domain: 'staging-resume-znpp.herokuapp.com'}
end
