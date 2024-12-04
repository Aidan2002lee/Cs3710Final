require 'rails_helper'

RSpec.describe "Accounts", type: :system do
  describe "Account Authentication" do
    # New User with correct info
    context "new user with correct info" do
      it "allows a user to sign up" do
        visit new_account_registration_path
        fill_in "First Name"
        fill_in "Last Name"
        select "Number of Songs You Want" from "Numericality"
        fill_in "Username", with "Username"
        fill_in "Email", with "from@example.com"
        fill_in "Password", with "password"
        fill_in "Passowrd confirmation" with "password"
        click_button "Sign up"
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end
      # User doesn't enter all of the information given

      # Test 2: Cannot have a user with the same info

      it "Doesn't sign up the user have the same info" do
        expect.error(sign up).to have_content("It looks like someone has the same info as you, sorry!")
      end

      # Test 3: When on playlist, user deletes a playlist and is redirected to playlist UI
      it "Reduces the number of Playlists on a user's account" do
        click_button "Delete Playlist"
        expect{
          delete "Playlists/#{playlist_id}"
      }.to change(Playliist, :count).by(-1)

      expect(response.body).to include("Playlist Successfully Destroyed.")
      end

      # Test 4: Returns an error when Playlist has incomplete info
      it "Produces an error of insuficcent information" do
        click_button "Add Playlist"
        expect.error(playlist).to have_content("Error: Category cannot be blank")
      end
    end
  end 
end
