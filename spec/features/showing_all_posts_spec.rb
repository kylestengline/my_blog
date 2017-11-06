require 'rails_helper'

RSpec.feature "Showing all posts" do

  create_posts

  before(:each) do
    visit root_path
  end

  scenario "#life" do
    click_link "Life"

    expect(page).to have_current_path lives_path
    expect(page).to have_content "Home"
    expect(page).to have_content "View Code Posts"
    expect(page).to have_content "View Life Posts"
    expect(page).to have_content life.title
    expect(page).to have_content life.created_at.strftime("%B %d, %Y")
    expect(page).to have_content life.content.truncate(1000)
  end

  scenario "#code" do
    click_link "Code"

    expect(page).to have_current_path codes_path
    expect(page).to have_content "Home"
    expect(page).to have_content "View Code Posts"
    expect(page).to have_content "View Life Posts"
    expect(page).to have_content code.title
    expect(page).to have_content code.created_at.strftime("%B %d, %Y")
    expect(page).to have_content code.content.truncate(1000)
  end
end
