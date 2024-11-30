class Song < ApplicationRecord
  belongs_to :playlist

  def self.new_from_spotify_song(spotify_song)
    Song.new(
      spotify_id: spotify_song.id,
      title: spotify_song.title,
      artists: spotify_song.artists[0].name,
      release_date: spotify_song.release_date,
      explicit: spotify_song.explicit["E"]
    )
  end

  def self.create_from_spotify_song(spotify_song)
    song = self.new_from_spotify_song(spotify_song)
    song.save
    song
  end
end
