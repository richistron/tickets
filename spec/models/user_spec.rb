require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:events) }

  it 'should create a valid user' do
    user = FactoryGirl.build :user
    expect(user).to be_valid
  end

  it 'should not create a user with a 3 character password' do
    user = User.create
    expect(user.errors).to have_key(:password)
  end

  it 'should not crate new user with no email' do
    user = User.create
    expect(user.errors).to have_key(:email)
  end
end
