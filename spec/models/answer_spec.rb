require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject { create(:answer) }

  it { should belong_to(:user) }
  it { should belong_to(:question) }
  it { should belong_to(:alternative) }

  it 'validate uniqueness' do
    user = create(:user)
    question = create(:question)
    alternative = create(:alternative)
    answer = Answer.create(user: user,
                           question: question,
                           alternative: alternative)
    invalid_answer = Answer.new(user: user,
                                question: question,
                                alternative: alternative)

    expect(invalid_answer.valid?).to be false
  end
end
