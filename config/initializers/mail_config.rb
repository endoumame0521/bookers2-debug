ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
	address: 'smtp.gmail.com',
	domain: 'gmail.com',
	port: 587,
	user_name: ENV['G-MAIL_ADDRESS'],
	password: ENV['PASS_WORD'],
	authentication: 'plain',
	enable_starttls_auto: true
}
