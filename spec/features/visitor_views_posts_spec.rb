require 'rails_helper'

RSpec.feature "visiting a post" do

  create_posts

  before(:each) do
    visit root_path
  end

  scenario "visitor visits a life post" do
    click_link "Life"
    click_on life.title

    expect(page).to have_current_path life_path(life)
    expect(page).to have_content "View Life Posts"
    expect(page).to have_content life.title
    expect(page).to have_content life.content
    expect(page).to have_content life.created_at.strftime("%B %d, %Y")
    expect(page).to have_no_content "Edit"
    expect(page).to have_no_content "Delete"
  end

  scenario "visitor visits a code post" do
    click_link "Code"
    click_on code.title

    expect(page).to have_current_path code_path(code)
    expect(page).to have_content "View Life Posts"
    expect(page).to have_content code.title
    expect(page).to have_content code.content
    expect(page).to have_content code.created_at.strftime("%B %d, %Y")
    expect(page).to have_no_content "Edit"
    expect(page).to have_no_content "Delete"
  end
end
