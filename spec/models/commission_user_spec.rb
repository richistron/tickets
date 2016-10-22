require 'rails_helper'

RSpec.describe CommissionUser, type: :model do

  it { should belong_to(:user) }
  it { should belong_to(:payment_method) }

  it 'should validate presence of amount' do
    commission = CommissionUser.create
    expect(commission.errors.messages).to have_key(:amount)
  end

  it 'should validate precense of is_percentage' do
    commission = CommissionUser.create
    expect(commission.errors.messages).to have_key(:is_percentage)
  end

  it 'should save a valid CommissionUser' do
    payment_method = FactoryGirl.build :payment_method
    user = FactoryGirl.build :user
    commission = FactoryGirl.build :commission_user,
                                  payment_method: payment_method, user: user
    expect(commission.save).to be(true)
  end
end
