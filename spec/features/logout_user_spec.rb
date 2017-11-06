require 'rails_helper'

RSpec.feature "Users Logout" do
  
  let(:user) { User.create(email: "me@example.com", password: "password") }

  scenario "#successful logout" do
    sign_in_as_user
    click_on "Code"
    click_on "Sign Out"
    expect(page).to have_current_path sign_in_path
  end
end
