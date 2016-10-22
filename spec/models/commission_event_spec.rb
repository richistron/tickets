require 'rails_helper'

RSpec.describe CommissionEvent, type: :model do

  it { should belong_to(:payment_method) }
  it { should belong_to(:event) }

  it 'should validate presence of amount' do
    commission = CommissionEvent.create
    expect(commission.errors.messages).to have_key(:amount)
  end

  it 'should validate precense of is_percentage' do
    commission = CommissionEvent.create
    expect(commission.errors.messages).to have_key(:is_percentage)
  end

  it 'should save a valid CommissionEvent' do
    payment_method = FactoryGirl.build :payment_method
    event = FactoryGirl.build :event
    commission = FactoryGirl.build :commission_event,
                                  payment_method: payment_method, event: event
    expect(commission.save).to be(true)
  end

end
