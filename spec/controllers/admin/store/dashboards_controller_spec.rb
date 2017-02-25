require 'rails_helper'

RSpec.describe Admin::Store::DashboardsController, type: :controller do
  let(:article) { FactoryGirl.create(:article) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:article) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:article).merge({title: nil}) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:valid_session) { sign_in(admin) }

  describe "GET #index" do
    it "returns http success" do
      allow(controller).to receive(:current_user).and_return(admin)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
