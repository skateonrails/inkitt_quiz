require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe 'GET #show' do
    it 'returns http success' do
      user = create(:user)
      question = create(:question)

      get :show, params: { id: question.id }, session: { current_user_id: user.id }

      expect(response).to have_http_status(:success)
    end
  end
end
