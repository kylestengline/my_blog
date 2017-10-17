require 'rails_helper'

RSpec.describe Life, type: :model do
  let!(:life) { FactoryGirl.create(:life) }

  it "is valid with valid attributes" do
    expect(life).to be_valid
  end

  it "is invalid without a title" do
    life.title = ""
    expect(life).to_not be_valid
  end

  it "is invalid without content" do
    life.content = ""
    expect(life).to_not be_valid
  end

  describe "associations" do
    it { should belong_to(:user) }
  end
end
