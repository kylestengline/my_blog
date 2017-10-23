require 'rails_helper'

RSpec.describe LivesController, type: :controller do

  let!(:life) { FactoryGirl.create(:life) }

  describe "visitor views life posts" do
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
  end
end
