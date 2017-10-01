FactoryGirl.define do
  factory :answer do
    user { build(:user) }
    question { build(:question) }
    alternative { build(:alternative) }
  end
end
