FactoryGirl.define do
  factory :question do
    title { Faker::Name.title }
  end
end
