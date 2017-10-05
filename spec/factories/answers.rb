FactoryGirl.define do
  factory :answer do
    user { create(:user) }
    question { create(:question) }
    alternative { create(:alternative) }
  end
end
