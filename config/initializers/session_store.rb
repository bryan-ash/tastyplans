# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mabel_session',
  :secret      => '804fb2424af03b8208b092f7cb50921a3f0e54bb354d6c85929191797ec0fbbbf460d0f2138104acb0bbe3872e214a772108c15d68344e4292de430eeedd1d8e'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
