# Configuration of the mail server connection.
#
# This file is intended to be modified according to your needs.
# The standard behavious is to read the configuration values from environment
# variables. Head to the README.md file for further information.
RackSendmail.setup do |config|
  config.server      = ENV['RACKSENDMAIL_SERVER']      || 'smtp.my-mailserver.com'
  config.port        = ENV['RACKSENDMAIL_PORT']        || 25
  config.helo        = ENV['RACKSENDMAIL_HELO']        || 'my-domain.com'
  config.username    = ENV['RACKSENDMAIL_USERNAME']    || 'mailserver-user'
  config.password    = ENV['RACKSENDMAIL_PASSWORD']    || 'misterious-password'
  config.target_mail = ENV['RACKSENDMAIL_TARGET_MAIL'] || 'me@example.org'
end
