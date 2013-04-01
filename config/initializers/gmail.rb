ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'your.host.name',
  :user_name            => ENV('MAIL_USERNAME'), # full email address (user@your.host.name.com)
  :password             => ENV('MAIL_PASSWORD'),
  :authentication       => 'plain',
  :enable_starttls_auto => true
}