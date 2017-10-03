require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { create(:question) }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should have_many(:alternatives) }

  describe 'Define questions hierarchy' do
    it 'should set parent on child question' do
      new_question = create(:question)

      subject.add_child new_question

      expect(new_question.parent).to eq(subject)
      expect(subject.children.include?(new_question)).to be true
    end
  end

  describe '#next_question' do
    context 'without child question' do
      it { expect(subject.next_question).to be_nil }
    end

    context 'with child' do
      it 'should return first child' do
        new_question = create(:question)

        subject.add_child new_question

        expect(subject.next_question).to eq(new_question)
      end
    end
  end

  describe '#previous_question' do
    context 'without parent question' do
      it { expect(subject.previous_question).to be_nil }
    end

    context 'with parent' do
      it 'should return first child' do
        new_question = create(:question)
        subject.parent = new_question

        expect(subject.previous_question).to eq(new_question)
      end
    end
  end
end
