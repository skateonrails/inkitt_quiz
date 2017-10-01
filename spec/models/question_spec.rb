require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { create(:question) }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should have_many(:answers) }

  describe 'Define questions hierarchy' do
    it 'should set parent on child question' do
      new_question = create(:question)

      subject.add_child new_question

      expect(new_question.parent).to eq(subject)
      expect(subject.children.include?(new_question)).to be true
    end
  end
end
