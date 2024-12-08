class SongsController < ApplicationController

before_action :get_playlist

def index
    @songs = RSpotify::Song.search(params[:playlist_id])
end

def show
  @song = RSpotify:Song.find(params[:playlist_id])
end

def new
    @playlists = Playlist.find(params[:playlist_id])
    @song = Song.new
end

def add_song
    
    @song = playlist.RSpotify:Song.find(params[:id])
    respond_to do |format|
      if @song.save
        format.html { redirect_to playlist_song_url(@playlist, @song), notice: "Song successfully added." }
        format.json { render :show, status: :created, location: @song }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete_song
    @song = RSpotify::Song.find(params[:id])
    @song.destroy!

    respond_to do |format|
      format.html { redirect_to playlist_song_url(@playlist, @song), notice: "Song Successfully Deleted." }
      format.json { head :no_content }
    end
  end

  private

  def get_playlist
    @playlist = Playlist.find(params[:playlist_id])
  end

  def song_params
    params.require(:song).permit(:title, :artist, :release_date, :explicit, :spotify_id, :genre, :language)
  end
end

