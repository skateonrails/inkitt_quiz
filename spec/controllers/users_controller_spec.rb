require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    before :each do
      post :create, params: attributes
    end

    context 'with invalid attributes' do
      let(:attributes) {
        { user: { email: '' } }
      }

      it { expect(flash[:error]).to be_present }
      it { expect(response).to redirect_to(root_path) }
    end

    context 'with valid attributes' do
      let(:attributes) {
        { user: attributes_for(:user) }
      }

      it { expect(flash[:error]).not_to be_present }
      it { expect(response).to redirect_to(root_path) }
    end
  end

end
