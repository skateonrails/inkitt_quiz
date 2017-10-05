FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    fingerprint_hash { Faker::Crypto.md5 }
    factory :user_with_finished_quiz do
      finished_quiz true
    end
  end
end
