require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
      expect(session[:current_user_id]).to be_nil
    end
  end

  describe 'POST #create' do
    before :each do
      create(:question)
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
      it { expect(response).to redirect_to(question_path(Question.first)) }
      it { expect(session[:current_user_id]).to be_present }
    end

    context 'with already existent attributes and finished quiz' do
      let(:user) { create(:user_with_finished_quiz) }
      let(:attributes) {
        { user: user.attributes }
      }

      it { expect(flash[:notice]).to be_present }
      it { expect(response).to redirect_to(answers_path) }
      it { expect(session[:current_user_id]).to be_present }
    end

    context 'with already existent attributes' do
      let(:user) { create(:user) }
      let(:attributes) {
        { user: user.attributes }
      }

      it { expect(flash[:notice]).to be_present }
      it { expect(response).to redirect_to(question_path(Question.first)) }
      it { expect(session[:current_user_id]).to be_present }
    end
  end

end
