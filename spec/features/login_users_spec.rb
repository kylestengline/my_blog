require 'rails_helper'

RSpec.feature "Users can log in" do

  let(:user) { User.create(email: "me@example.com", password: "password") }

  scenario "#success" do
    visit sign_in_path

    fill_in "Email", with: user.email
    fill_in "Password", with: user.password

    click_button "Sign in"

    expect(page).to have_current_path root_path
    expect(page).to have_link "Admin Life Posts" 
    expect(page).to have_link "Admin Code Posts" 
    expect(page).to have_link "New Code Post" 
    expect(page).to have_link "New Life Post" 
  end
  
  scenario "#failure" do

    visit sign_in_path

    fill_in "Email", with: ""
    fill_in "Password", with: ""

    click_button "Sign in"

    expect(page).to have_current_path session_path 
    expect(page).to have_content "Bad email or password."
  end
end
