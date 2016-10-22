require 'rails_helper'

RSpec.describe CommissionDefault, type: :model do

  it { should belong_to(:payment_method) }

  it 'should validate presence of amount' do
    commission = CommissionDefault.create
    expect(commission.errors.messages).to have_key(:amount)
  end

  it 'should validate precense of is_percentage' do
    commission = CommissionDefault.create
    expect(commission.errors.messages).to have_key(:is_percentage)
  end

  it 'should save a valid CommissionDefault' do
    payment_method = FactoryGirl.build :payment_method
    commission = FactoryGirl.build :commission_default,
                                      payment_method: payment_method
    expect(commission.save).to be(true)
  end
end
