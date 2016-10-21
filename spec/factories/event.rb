FactoryGirl.define do
  factory :event do
    title 'title'
    description 'description'
    amount_of_tickets 10
    ticket_cost 120.50
    fee_included false
    user
  end
end
