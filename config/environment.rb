# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  :user_name => '3b23d3a538d2ac',
  :password => 'bf373b9461f83b',
  :address => 'smtp.mailtrap.io',
  :domain => 'smtp.mailtrap.io',
  :port => '2525',
  :authentication => :cram_md5
}