class Api::V1::SongsController < ApplicationController
    def index
        @songs = Songs.all
        render json: @songs
    end

    def search
        s_songs = RSpotify::Song_search(params[:q])
        @songs = s_songs.map do |s_song|
            Songs.new_from_spotify_song(s_song)
        end
    render json: @songs
    end
end
