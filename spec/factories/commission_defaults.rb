FactoryGirl.define do
  factory :commission_default do
    amount 2
    is_percentage true
    payment_method
  end
end
