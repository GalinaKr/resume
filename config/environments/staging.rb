# Just use the production settings
require File.expand_path('../production.rb', __FILE__)

Rails.application.configure do

  # Setup copy/pasted from https://heroku.mailtrap.io/inboxes/1136108/messages
  # Click on My Inbox, SMTP Settings, then select RoR from Integrations
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    domain:               'herokuapp.com',
    user_name:            'resume.znpp@gmail.com',
    password:             '!1Qwerty',
    authentication:       'plain',
    enable_starttls_auto: true }
end
