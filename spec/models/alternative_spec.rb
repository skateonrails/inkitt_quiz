require 'rails_helper'

RSpec.describe Alternative, type: :model do
  subject { create(:alternative) }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title).scoped_to(:question_id) }
  it { should belong_to(:question) }
end
