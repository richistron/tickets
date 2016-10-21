require 'rails_helper'

RSpec.describe Event, type: :model do

  it { should belong_to(:user) }

  it 'should validate user presence' do
    event = Event.create
    expect(event.errors).to have_key(:user)
  end

  it 'should validate presence of title' do
    event = Event.create
    expect(event.errors).to have_key(:title)
  end

  it 'should validate presence of description' do
    event = Event.create
    expect(event.errors).to have_key(:description)
  end

  it 'should validate presence of amount_of_tickets' do
    event = Event.create
    expect(event.errors).to have_key(:amount_of_tickets)
  end

  it 'should validate presence of ticket_cost' do
    event = Event.create
    expect(event.errors).to have_key(:ticket_cost)
  end

  it 'should create a valid event' do
    user = FactoryGirl.build :user
    event = Event.new user:user, title: 'title', description: 'description', \
                                    amount_of_tickets: 10, ticket_cost: 120.50
    expect(event.valid?).to be(true)
  end
end
