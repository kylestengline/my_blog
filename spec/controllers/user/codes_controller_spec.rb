require 'rails_helper'
require 'user/codes_controller'

RSpec.describe User::CodesController, type: :controller do

  let!(:user) { User.create(email: "user@example.com", password: "password") }
  let!(:code) { FactoryBot.create(:code) }

  before(:each) do
    sign_in_as user
    expect(response).to have_http_status(:success)
  end

  describe "admin pages" do
    it { has_before_filters(:require_login) }
    render_views

    context "#index" do
      it "shows all the code posts" do
        get :index
        expect(response).to render_template :index
        within ".title" do
          expect(response.body).to have_css "a[href='/user/codes/#{code.id}']"
        end
      end
    end

    context "#show" do
      it "shows one of the code posts" do
        get :show, params: { id: code.id }
        expect(response).to render_template :show
      end
    end

    context "#create" do
      it "posts a new code post" do
        post :create, params: {
          code: { 
            created_at: Date.today, 
            title: "Code things", 
            content: "The content of the code post",
            user_id: user.id
          }
        }
        expect(response).to redirect_to user_codes_path
        expect(flash[:success]).to eq "Post created successfully."
      end

      it "errors when a post is not created" do
        post :create, params: {
          code: {
            created_at: Date.today, 
            title: "", 
            content: "",
            user_id: user.id
          }
        }
        expect(response).to render_template :new
        expect(flash[:danger]).to eq "Post was not created."
      end
    end

    context "#edit" do
      it "edits a code post" do
        get :edit, params: { id: code }
        expect(response).to render_template :edit
      end
    end

    context "#update" do
      let(:code2) do 
        { title: "Updated title", content: "Updated content" }
      end

      it "updates a code post" do
        put :update, params: { id: code, code: code2 }
        code.reload
        expect(response).to redirect_to user_code_path(code)
        expect(code.title).to eq code2[:title]
        expect(code.content).to eq code2[:content]
        expect(flash[:success]).to eq "Post updated successfully."
      end
    end

    context "#destroy" do
      it "deletes a code post" do
        expect{
          delete :destroy, params: { id: code }
        }.to change(Code, :count).by(-1)
      end
    end
  end
end
