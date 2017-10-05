require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should allow_value('example@domain.com').for(:email) }
  it { should validate_presence_of(:fingerprint_hash) }
  it { should validate_uniqueness_of(:fingerprint_hash).scoped_to(:email) }
  it { should have_many(:answers) }

  describe '.finished' do
    it 'should return only users that finished the quiz' do
      finished_quiz_user = create(:user_with_finished_quiz)
      not_finished_quiz_user = create(:user)

      expect(User.finished_quiz.count).to eq(1)
      expect(User.finished_quiz.first).to eq(finished_quiz_user)
    end
  end
end
