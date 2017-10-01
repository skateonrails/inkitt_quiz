require 'rails_helper'

RSpec.describe Alternative, type: :model do
  subject { create(:alternative) }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should belong_to(:question) }
end
