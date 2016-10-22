require 'rails_helper'

RSpec.describe Purchase, type: :model do

  it { should belong_to(:payment_method) }

  it { should belong_to(:event) }

  it 'should validate presence of amount' do
    purchase = Purchase.create
    expect(purchase.errors.messages).to have_key(:amount)
  end

  it 'should validate amount as number' do
    purchase = Purchase.create amount: 'string'
    expect(purchase.errors.messages).to have_key(:amount)
  end

  it 'should not validate, this prices are incorrect' do
    user = FactoryGirl.build :user
    user.save
    event = FactoryGirl.build :event, user: user
    event.save
    payment_method = FactoryGirl.build :payment_method
    payment_method.save
    commission_event = FactoryGirl.build :commission_event, payment_method: payment_method, event: event
    commission_event.save
    purchase = FactoryGirl.build :purchase, event: event, payment_method: payment_method
    expect(purchase.valid?).to be(false)
  end

  it 'should validate, this prices are correct' do
    user = FactoryGirl.build :user
    user.save
    event = FactoryGirl.build :event, user: user
    event.save
    payment_method = FactoryGirl.build :payment_method
    payment_method.save
    commission_event = FactoryGirl.build :commission_event, payment_method: payment_method, event: event
    commission_event.save
    purchase = FactoryGirl.build :purchase, event: event, payment_method: payment_method
    purchase.amount = 420.5
    expect(purchase.valid?).to be(true)
  end

  it 'using CommissionEvent' do
    user = FactoryGirl.build :user
    user.save
    event = FactoryGirl.build :event, user: user
    event.save
    payment_method = FactoryGirl.build :payment_method
    payment_method.save
    commission_event = FactoryGirl.build :commission_event, payment_method: payment_method, event: event
    commission_event.save
    purchase = FactoryGirl.build :purchase, event: event, payment_method: payment_method
    expect(purchase.get_commission).to be_instance_of(CommissionEvent)
  end

  it 'using CommissionUser' do
    user = FactoryGirl.build :user
    user.save
    event = FactoryGirl.build :event, user: user
    event.save
    payment_method = FactoryGirl.build :payment_method
    payment_method.save
    commission_user = FactoryGirl.build :commission_user, payment_method: payment_method, user: user
    commission_user.save
    purchase = FactoryGirl.build :purchase, event: event, payment_method: payment_method
    expect(purchase.get_commission).to be_instance_of(CommissionUser)
  end

  it 'using CommissionDefault' do
    user = FactoryGirl.build :user
    user.save
    event = FactoryGirl.build :event, user: user
    event.save
    payment_method = FactoryGirl.build :payment_method
    payment_method.save
    commission = FactoryGirl.build :commission_default, payment_method: payment_method
    commission.save
    purchase = FactoryGirl.build :purchase, event: event, payment_method: payment_method
    expect(purchase.get_commission).to be_instance_of(CommissionDefault)
  end
end
