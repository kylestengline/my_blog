def sign_in_as_user
  user = FactoryGirl.create :user
  visit sign_in_path

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password

  click_button "Sign in"
end

def post_expectations
  expect(page).to have_content "Post created successfully."
  expect(page).to have_content "Title of post"
  expect(page).to have_content "The content of my post"
end

def fill_in_post_fields
  fill_in "Title", with: "Title of post"
  fill_in "Content", with: "The content of my post"
end

def failed_post
  expect(page).to have_content "Title can't be blank"
  expect(page).to have_content "Content can't be blank"
  expect(page).to have_content "Post was not created."
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

def create_posts
  let!(:code) { FactoryGirl.create(:code) }
  let!(:life) { FactoryGirl.create(:life) }
end

def before_filter
  it { has_before_filters(:require_login) }
end
