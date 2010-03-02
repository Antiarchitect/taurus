# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_taurus_session',
  :secret      => '3a04bef7899d2955f459a8d5519cc86adb1ad13041eee5d8668789380a116481602d2bfa457d9458ad12537fe6b5c030452dd61fe816d452eb3d0aaffdf6df78'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
