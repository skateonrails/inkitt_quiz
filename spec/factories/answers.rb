FactoryGirl.define do
  factory :answer do
    title { Faker::Name.title }
    question { build(:question) }
  end
end
