#require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify,
           ENV["spotify_client_id"],
           ENV["spotify_secret_key"],
           scope: 'user-read-email user-read-private playlist-modify-public user-library-read user-library-modify streaming'
end
