require 'rails_helper'

RSpec.feature "Homepage" do

  let!(:user) { User.create(email: "me@example.com", password: "password") }

  scenario "it shows the content on the homepage" do
    visit root_path

    expect(page).to have_link "Home"
    expect(page).to have_link "Life"
    expect(page).to have_link "Code"
  end

  scenario "when user is signed in it shows different content" do
    sign_in_user user
    expect(page).to have_content "Admin Life Posts"
    expect(page).to have_content "Admin Code Posts"
    expect(page).to have_link "New Code Post" 
    expect(page).to have_link "New Life Post" 
  end
end
