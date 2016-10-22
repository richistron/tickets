FactoryGirl.define do
  factory :commission_user do
    amount 15.5
    is_percentage true
    payment_method
    user
  end
end
