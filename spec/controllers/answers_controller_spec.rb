require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  describe 'POST #create' do
    let(:question) { create(:question) }
    let(:alternative) { create(:alternative, question: question) }
    let(:user) { create(:user) }

    before :each do
      post :create, params: attributes, session: { current_user_id: user.id }
    end

    context 'with invalid attributes' do
      let(:attributes) {
        { question_id: question.id, answer: { alternative_id: nil } }
      }

      it { expect(flash[:error]).to be_present }
      it { expect(response).to redirect_to(question_path(question)) }
    end

    context 'with valid attributes and with a next question to answer' do
      let(:next_question) { create(:question, parent: question) }
      let(:attributes) {
        { question_id: next_question.previous_question.id,
          answer: { alternative_id: alternative.id } }
      }

      it { expect(flash[:error]).not_to be_present }
      it { expect(response).to redirect_to(question_path(next_question)) }

      it 'should create answer with user/question/alternative' do
        answer = Answer.first
        expect(answer.user).to eq(user)
        expect(answer.question).to eq(question)
        expect(answer.alternative).to eq(alternative)
      end
    end

    context 'with valid attributes and without a next question to answer' do
      let(:attributes) {
        { question_id: question.id, answer: { alternative_id: alternative.id } }
      }

      it { expect(flash[:error]).not_to be_present }
      # TODO: expect redirect to result path
      #it { expect(response).to redirect_to(question_path(next_question)) }
    end
  end
end
