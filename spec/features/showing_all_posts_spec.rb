require 'rails_helper'

RSpec.feature "Showing all posts" do

  let!(:codes) { FactoryGirl.create(:code) }
  let!(:lives) { FactoryGirl.create(:life) }

  before(:each) do
    visit root_path
  end

  scenario "#life" do
    click_link "Life"

    expect(page).to have_current_path lives_path
    expect(page).to have_content lives.created_at.to_date
    expect(page).to have_link lives.title
    expect(page).to have_content lives.content.truncate(300)
  end

  scenario "#code" do
    click_link "Code"

    expect(page).to have_current_path codes_path
    expect(page).to have_content codes.created_at.to_date
    expect(page).to have_link codes.title
    expect(page).to have_content codes.content.truncate(300)
  end
end
