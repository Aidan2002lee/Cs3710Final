class Playlist < ApplicationRecord
  has_many :songs
  belongs_to :account
  validates :description, :name, presence: true, uniqueness: true
  validates :capacity_of_songs, numericality: {only_integer: true, greater_than_or_equal_to: 1 }
end
