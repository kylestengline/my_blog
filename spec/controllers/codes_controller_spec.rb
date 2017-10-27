require 'rails_helper'

RSpec.describe CodesController, type: :controller do

  let!(:code) { FactoryGirl.create(:code) }

  describe "visitors view code posts" do
    render_views

    before(:each) do
      expect(response).to have_http_status :success
    end

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
  end
end
