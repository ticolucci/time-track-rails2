# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_time_tracker-v2_session',
  :secret      => '65e4b45ec57788e60b4fd656c5874b22d207176049c0acc219620758da181e8004fc976b35311bfc6b59b2c2ae085c77fbb7eaf5300a5604927a9dff091c6691'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
