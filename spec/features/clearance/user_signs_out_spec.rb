require "rails_helper"
require "support/features/clearance_helpers"

RSpec.feature "User signs out" do

  scenario "signs out" do
    sign_in
    click_on "Life"
    sign_out

    expect_user_to_be_signed_out
  end
end
