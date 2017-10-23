require 'rails_helper'
require 'user/lives_controller'

RSpec.describe User::LivesController, type: :controller do

  let!(:user) { User.create(email: "user@example.com", password: "password") }
  let!(:life) { FactoryGirl.create(:life) }

  before(:each) do
    sign_in_as user
    expect(response).to have_http_status(:success)
  end

  describe "admin pages" do
    render_views

    context "#index" do
      it "shows all the life posts" do
        get :index
        expect(response).to render_template :index
        within ".title" do
          expect(response.body).to have_css "a[href='/user/life/#{life.id}']"
        end
      end
    end

    context "#show" do
      it "shows one of the life posts" do
        get :show, params: { id: life.id }
        expect(response).to render_template :show
      end
    end

    context "#create" do
      it "posts a new life post" do
        post :create, params: {
          life: { 
            created_at: Date.today, 
            title: "Code things", 
            content: "The content of the life post",
            user_id: user.id
          }
        }
        expect(response).to redirect_to user_lives_path
        expect(flash[:success]).to eq "Post created successfully."
      end
    end

    context "#edit" do
      it "edits a life post" do
        get :edit, params: { id: life }
        expect(response).to render_template :edit
      end
    end

    context "#update" do
      let(:life2) do 
        { title: "Updated title", content: "Updated content" }
      end
      it "updates a life post" do
        put :update, params: { id: life, life: life2 }
        life.reload
        expect(response).to redirect_to user_life_path(life)
        expect(life.title).to eq life2[:title]
        expect(life.content).to eq life2[:content]
        expect(flash[:success]).to eq "Post updated successfully."
      end
    end

    context "#destroy" do
      it "deletes a life post" do
        expect{
          delete :destroy, params: { id: life }
        }.to change(Life, :count).by(-1)
      end
    end
  end
end
