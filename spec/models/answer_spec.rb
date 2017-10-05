require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject { create(:answer) }

  it { should belong_to(:user) }
  it { should belong_to(:question) }
  it { should belong_to(:alternative) }
  it { should validate_uniqueness_of(:user).scoped_to(:question_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:question_id) }
  it { should validate_presence_of(:alternative_id) }

  describe '.finished' do
    it 'should get answers from users who finished quiz' do
      finished_quiz_user = create(:user_with_finished_quiz)
      not_finished_quiz_user = create(:user)
      finished_answer = create(:answer, user: finished_quiz_user)
      not_finished_answer = create(:answer, user: not_finished_quiz_user)

      expect(Answer.finished.count).to eq(1)
      expect(Answer.finished.first).to eq(finished_answer)
    end
  end
end
