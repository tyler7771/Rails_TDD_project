
require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_path
    expect(page).to have_content "Sign Up"
  end

  feature "signing up a user" do

    scenario "shows username on the homepage after signup" do
      sign_up_user
      expect(page).to have_content "Jim"
    end
  end

end

feature "logging in" do

  scenario "shows username on the homepage after login" do
    User.create!(username: "Jim", password: "123456")
    visit new_session_path
    fill_in('Username', with: "Jim")
    fill_in('Password', with: '123456')
    click_button('Sign In')

    expect(page).to have_content("Jim", count: 2)
  end


end

feature "logging out" do
  before :each do
    sign_up_user
    click_button("Log Out")
  end

  scenario "begins with a logged out state" do
    expect(page).to have_content "Sign In"
  end

  scenario "doesn't show username on the homepage after logout" do
    visit users_path
    expect(page).to have_content("Jim", count: 1)
  end
end
