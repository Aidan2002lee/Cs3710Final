class Api::V1::SongsController < ApplicationController
    def index
        @songs = Song.all
        render json: @songs
    end

    def search
        if params[:q].blank?
            render json: { error: "Query parameter 'q' is missing or empty "}, status: :bad_request
            return
        end
        
        s_songs = RSpotify::Track.search(params[:q])
        @songs = s_songs.map do |s_song|
            Songs.new_from_spotify_song(s_song)
        end
    render json: @songs
    end
end
