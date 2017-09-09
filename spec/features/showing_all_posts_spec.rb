require 'rails_helper'

RSpec.feature "Showing all posts" do
  
  before(:each) do
    visit root_path
  end

  let(:users) { User.create(email: "user@example.com", password: "password") }
  let(:posts) { Post.create(title: "All the things", content: "The content of my post", user_id: users.id) }

  scenario "#life-in-general" do
    pending("awaiting login feature")
    
    click_link "Life In General"
    expect(page).to have_current_path life_in_general_path
    expect(page).to have_content posts.timestamps
    expect(page).to have_link posts.title
    expect(page).to have_content posts.content
  end

end
