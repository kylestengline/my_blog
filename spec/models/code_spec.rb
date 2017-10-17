require 'rails_helper'

RSpec.describe Code, type: :model do
  let!(:code) { FactoryGirl.create(:code) }

  it "is valid with valid attributes" do
    expect(code).to be_valid
  end

  it "is invalid without a title" do
    code.title = ""
    expect(code).to_not be_valid
  end

  it "is invalid without content" do
    code.content = ""
    expect(code).to_not be_valid
  end

  describe "associations" do
    it { should belong_to(:user) }
  end
end
