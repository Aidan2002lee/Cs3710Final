require 'rails_helper'

RSpec.describe Account, type: :model do
  context 'User must sign in with accurate information' do
  describe 'validations' do
    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:username)}
    it { should validate_presence_of{:email}}

    describe '#of_songs' do
    it 'returns a number that is greater than 1' do
      num_of_songs_you_want = numericality {only_integer greater_than_or_equal_to 1}
    end
  context 'holds infinite number of playlists' do
    it 'returns a new playlist' do
      link "New Playlist"
      expect{
        create "playlist/#{:id}"
    }.to change(@account, playlist).count(+1)

    until "user deletes playlist"
  end

  context 'User can being adding playlists once signed in' do
    describe 'validations' do
      it { should validate_presence_of(:name)}
      it {should validate_presence_of(description)}

      describe "capacity_of_songs" do
        it 'returns a number greater than 1' do
          capacity_of_songs >= 1
        end

  
end
