FactoryGirl.define do
  factory :commission_event do
    amount 300
    is_percentage false
    payment_method
    event
  end
end
