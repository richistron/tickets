require 'rails_helper'

RSpec.describe PaymentMethod, type: :model do
  it 'should save a valid PyamentMethod' do
    payment_method = FactoryGirl.build :payment_method
    expect(payment_method.valid?).to be(true)
  end

  it 'should validate presence of name' do
    payment_method = PaymentMethod.new
    expect(payment_method.valid?).to be(false)
  end
end
