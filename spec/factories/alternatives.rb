FactoryGirl.define do
  factory :alternative do
    title { Faker::Name.title }
    question { build(:question) }
  end
end
