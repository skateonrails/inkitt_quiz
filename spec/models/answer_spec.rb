require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject { create(:answer) }

  it { should belong_to(:user) }
  it { should belong_to(:question) }
  it { should belong_to(:alternative) }
  it { should validate_uniqueness_of(:user).scoped_to(:question_id) }
end
