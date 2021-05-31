# Just use the production settings
require File.expand_path('../production.rb', __FILE__)

Rails.application.configure do
  # Here override any defaults
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'herokuapp.com',
    user_name:            'resume.znpp@gmail.com',
    password:             '!1Qwerty',
    authentication:       'plain' }
end
