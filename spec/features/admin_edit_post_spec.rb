require 'rails_helper'

RSpec.feature "Admin edits" do

  before(:each) do
    sign_in_as_user
  end

  create_posts

  scenario "code posts" do
    visit root_path
    click_on "Admin Code Posts"
    click_on code.title 

    within ".edit-delete-actions" do
      click_on "Edit"
    end

    fill_in "code_title", with: "New title"
    fill_in "code_content", with: "New content"

    expect(page).to have_current_path edit_user_code_path(code.id)

    click_on "Update Code"

    expect(page).to have_content "Post updated successfully."
    expect(page).to have_current_path user_code_path(code)

  end

  scenario "life posts" do
    visit root_path
    click_on "Admin Life Posts"
    click_on life.title 

    within ".edit-delete-actions" do
      click_on "Edit"
    end

    fill_in "life_title", with: "New title"
    fill_in "life_content", with: "New content"

    expect(page).to have_current_path edit_user_life_path(life.id)

    click_on "Update Life"

    expect(page).to have_content "Post updated successfully."
    expect(page).to have_current_path user_life_path(life)

  end
end
