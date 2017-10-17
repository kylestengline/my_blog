require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(email: "user@example.com", password: "password") }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is invalid without a title" do
    user.email = ""
    expect(user).to_not be_valid
  end

  it "is invalid without content" do
    user.password = ""
    expect(user).to_not be_valid
  end

  describe "associations" do
    it { should have_many(:codes) }
    it { should have_many(:lives) }
  end
end
