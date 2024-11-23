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
    end
  end 
end
