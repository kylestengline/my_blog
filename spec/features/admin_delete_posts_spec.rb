require 'rails_helper'

RSpec.feature "Admin delete posts" do

  before(:each) do
    sign_in_as_user
  end

  create_posts

  scenario "an admin can delete a life post" do
    visit user_lives_path

    click_on life.title
    click_on "Delete"

    expect(page).to have_content "Post deleted successfully."
    expect(page).to have_current_path user_lives_path
  end

  scenario "an admin can delete a code post" do
    visit user_codes_path

    click_on code.title
    click_on "Delete"

    expect(page).to have_content "Post deleted successfully."
    expect(page).to have_current_path user_codes_path
  end
end
