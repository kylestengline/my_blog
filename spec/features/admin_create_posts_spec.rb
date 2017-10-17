require 'rails_helper'

RSpec.feature "Admin creates posts" do

  before(:each) do
    sign_in_as_user
    visit root_path
  end

  scenario "success in creating new life post" do
    click_on "New Life Post"
    fill_in_post_fields
    click_on "Create Life"

    expect(page).to have_current_path user_lives_path
    post_expectations
  end

  scenario "failure to create new life post" do
    click_on "New Life Post"
    fill_in "Title", with: ""
    fill_in "Content", with: ""
    click_on "Create Life"

    expect(page).to have_current_path user_lives_path
    failed_post
  end

  scenario "success in creating new code post" do
    click_on "New Code Post"
    fill_in_post_fields
    click_on "Create Code"

    expect(page).to have_current_path user_codes_path
    post_expectations
  end

  scenario "failure to create new code post" do
    click_on "New Code Post"
    fill_in "Title", with: ""
    fill_in "Content", with: ""
    click_on "Create Code"

    expect(page).to have_current_path user_codes_path
    failed_post
  end

end
