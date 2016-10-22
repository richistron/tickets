require 'rails_helper'

RSpec.describe Ticket, type: :model do

  it { should belong_to(:event) }

  it { should belong_to(:purchase) }

  context 'commissions with fee included' do
    user = FactoryGirl.build :user
    user.save
    event = FactoryGirl.build :event, user: user
    event.amount_of_tickets = 100
    event.ticket_cost = 100
    event.fee_included = true
    event.save
    payment_method = FactoryGirl.build :payment_method
    payment_method.save
    commission = FactoryGirl.build :commission_default, payment_method: payment_method
    commission.amount = 20
    commission.is_percentage = false
    commission.save
    purchase = FactoryGirl.build :purchase, event: event, payment_method: payment_method
    purchase.amount = 100.to_f
    purchase.save
    ticket = FactoryGirl.build :ticket, event: event, purchase: purchase


    it 'ticket cost' do
      expect(ticket.cost).to be(100.to_f)
    end

    it 'commissions' do
      expect(ticket.commission_fee).to be(20.to_f)
    end

    it 'purchase amount' do
      expect(ticket.total_amount).to be(100.to_f)
    end

    it 'your profit' do
      expect(ticket.profit).to be(80.to_f)
    end
  end

  context 'commissions with not fee included' do
    user = FactoryGirl.build :user
    user.save
    event = FactoryGirl.build :event, user: user
    event.amount_of_tickets = 2000
    event.ticket_cost = 100
    event.fee_included = false
    event.save
    payment_method = FactoryGirl.build :payment_method
    payment_method.save
    commission = FactoryGirl.build :commission_default, payment_method: payment_method
    commission.amount = 20
    commission.is_percentage = false
    commission.save
    purchase = FactoryGirl.build :purchase, event: event, payment_method: payment_method
    purchase.amount = 120.to_f
    purchase.save
    ticket = FactoryGirl.build :ticket, event: event, purchase: purchase


    it 'ticket cost' do
      expect(ticket.cost).to be(100.to_f)
    end

    it 'commissions' do
      expect(ticket.commission_fee).to be(20.to_f)
    end

    it 'purchase amount' do
      expect(ticket.total_amount).to be(120.to_f)
    end

    it 'your profit' do
      expect(ticket.profit).to be(100.to_f)
    end
  end

  context 'commissions with fee included percentage' do
    user = FactoryGirl.build :user
    user.save
    event = FactoryGirl.build :event, user: user
    event.amount_of_tickets = 100
    event.ticket_cost = 100
    event.fee_included = true
    event.save
    payment_method = FactoryGirl.build :payment_method
    payment_method.save
    commission = FactoryGirl.build :commission_default, payment_method: payment_method
    commission.amount = 10
    commission.is_percentage = true
    commission.save
    purchase = FactoryGirl.build :purchase, event: event, payment_method: payment_method
    purchase.amount = 100.to_f
    purchase.save
    ticket = FactoryGirl.build :ticket, event: event, purchase: purchase


    it 'ticket cost' do
      expect(ticket.cost).to be(100.to_f)
    end

    it 'commission fee' do
      expect(ticket.commission_fee).to be(10.to_f)
    end

    it 'ticket total amount' do
      expect(ticket.total_amount).to be(100.to_f)
    end

    it 'user profit' do
      expect(ticket.profit).to be(90.to_f)
    end
  end

  context 'commissions with not fee included percentage' do
    user = FactoryGirl.build :user
    user.save
    event = FactoryGirl.build :event, user: user
    event.amount_of_tickets = 2000
    event.ticket_cost = 100
    event.fee_included = false
    event.save
    payment_method = FactoryGirl.build :payment_method
    payment_method.save
    commission = FactoryGirl.build :commission_default, payment_method: payment_method
    commission.amount = 10
    commission.is_percentage = true
    commission.save
    purchase = FactoryGirl.build :purchase, event: event, payment_method: payment_method
    purchase.amount = 120.to_f
    purchase.save
    ticket = FactoryGirl.build :ticket, event: event, purchase: purchase


    it 'ticket cost' do
      expect(ticket.cost).to be(100.to_f)
    end

    it 'commission fee' do
      expect(ticket.commission_fee).to be(10.to_f)
    end

    it 'ticket total amount' do
      expect(ticket.total_amount).to be(110.to_f)
    end

    it 'user profit' do
      expect(ticket.profit).to be(100.to_f)
    end
  end
end
