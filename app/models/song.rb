class Song < ApplicationRecord
  belongs_to :playlist

  validates :title, :artist, :release_date, :explicit, :spotify_id, :genre, :language, presence: true

  VALID_LANGUAGES = ["English", "Spanish", "Japanese", "French", "German"]

  validates :language, inclusion: { in: VALID_LANGUAGES, message: "%{value} is not a valid language" }

  def self.new_from_spotify_song(spotify_song)
    Song.new(
      spotify_id: spotify_song.id,
      title: spotify_song.name,
      artists: spotify_song.artists[0].name || 'Unkown Artist', 
      release_date: spotify_song.album.release_date || 'Unknown',
      explicit: spotify_song.explicit ? "E" : "N",
      genre: spotify_song.album&.first || "Unknown",
      language: spotify_song.available_markets&.join(', ') || 'Unknown'
    )
  end

  def self.create_from_spotify_song(spotify_song)
    song = self.new_from_spotify_song(spotify_song)
    song.save
    song
  end

  def self.delete_from_spotify_song(spotify_song)
    song.destroy!(spotify_song)
    song.save
    song
  end

end
