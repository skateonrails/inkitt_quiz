require 'rails_helper'

RSpec.describe Answer, type: :model do
  subject { create(:answer) }

  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
end
