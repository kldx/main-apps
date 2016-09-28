require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  let(:article) { FactoryGirl.create(:article) }
  let(:valid_attributes) { FactoryGirl.attributes_for(:article) }
  let(:invalid_attributes) { FactoryGirl.attributes_for(:article).merge({title: nil}) }
  let(:user) { FactoryGirl.create(:user) }
  let(:valid_session) { sign_in(user) }

  describe "GET #index" do
    before { valid_session }
    it "returns http success" do
      allow(controller).to receive(:current_user).and_return(user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

end
