class PlaylistSerializer < ActiveModel::Serializer
  attributes :id, :name, :capacity_of_songs, :description
  has_one :account
end
