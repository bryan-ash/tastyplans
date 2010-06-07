# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
Rails.application.config.session_store :cookie_store, {
  :key    => '_mabel_session'
}

Rails.application.config.secret_token = '3fea047c249b99ce9f8c90f032a770a5b4c1b28a2365c84d9ad146f15fd2f9b2eaabeaf329fb60d0ee88dadcf2c3fccffee811d0cb4b3988f51aac509358d66e'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
