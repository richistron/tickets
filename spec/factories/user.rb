FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user#{n}#{rand}@factory.com" }
    sequence(:password){|n| "#{n}password" }
  end
end
