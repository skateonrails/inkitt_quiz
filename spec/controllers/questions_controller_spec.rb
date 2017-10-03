require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #next_question" do
    it "returns http success" do
      get :next_question
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #previous_question" do
    it "returns http success" do
      get :previous_question
      expect(response).to have_http_status(:success)
    end
  end

end
