# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_soccer_pool_session',
  :secret      => 'f183c3ae959f272a4dede7093c184442747e6ba13a4d8e6b6d1ab59bc8c9d6532d861741f02b1e7da1fef53cf09f2d0893eeadf32631ad5475aa02c81110000c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
