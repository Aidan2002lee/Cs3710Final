require 'rails_helper'

RSpec.describe Song, type: :model do
  context "while in the users playlist" do
    it "Creates a new song for a generated playlist in each song" do
      song = Song.new
      expect(song.count).to eq capacity_of_songs in playlist
    end
end
