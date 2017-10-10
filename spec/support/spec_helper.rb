def sign_in_as_user
  user = FactoryGirl.create :user
  visit sign_in_path

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password

  click_button "Sign in"
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end
