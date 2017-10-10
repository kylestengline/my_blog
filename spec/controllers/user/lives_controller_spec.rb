require 'rails_helper'

RSpec.describe User::LivesController, type: :controller do

  let!(:user) { User.create(email: "user@example.com", password: "password") }
  let!(:life) { Life.create(created_at: Date.today, title: "All the things", content: "The content of my post", user_id: user.id) }

  before(:each) do
    sign_in_as user
    expect(response).to have_http_status(:success)
  end

  describe "admin pages" do
    render_views

    it "shows all the code posts" do
      get :index
      expect(response).to render_template :index
      within ".title" do
        expect(response.body).to have_css "a[href='/user/life/#{life.id}']"
      end
    end

    it "shows one of the code posts" do
      get :show, params: { id: life.id }
      expect(response).to render_template :show
    end
  end

end
