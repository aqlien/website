ActionMailer::Base.smtp_settings = {
  :port           => '25',
  :address        => ENV['POSTMARK_SMTP_SERVER'],
  :user_name      => ENV['POSTMARK_API_KEY'],
  :password       => ENV['POSTMARK_API_KEY'],
  :domain         => 'aqlien-portfolio.heroku.com',
  :authentication => :plain,
}
ActionMailer::Base.delivery_method = :smtp

# config.action_mailer.delivery_method   = :postmark
# config.action_mailer.postmark_settings = { :api_key => ENV['POSTMARK_API_KEY'] }
