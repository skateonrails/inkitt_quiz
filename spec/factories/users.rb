FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    fingerprint_hash { Faker::Crypto.md5 }
  end
end
