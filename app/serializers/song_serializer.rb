class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :release_date, :explicit, :spotify_id
  has_one :playlist
end
