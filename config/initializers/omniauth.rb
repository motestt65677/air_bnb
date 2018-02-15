# In config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'],
		scope: 'email,user_birthday,public_profile', info_fields: 'first_name, last_name, email'
end	