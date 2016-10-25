class PagesController < ApplicationController
  def show
    RSpotify.authenticate(ENV["spotify_client_id"], ENV["spotify_secret_key"])
    me = RSpotify::User.find('guilhermesad')
    @list = me.playlists #=> (Playlist array)
  end
end
