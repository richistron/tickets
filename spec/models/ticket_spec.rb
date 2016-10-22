require 'rails_helper'

RSpec.describe Ticket, type: :model do

  it { should belong_to(:event) }

  it { should belong_to(:purchase) }

  pending 'should display the ticket cost amount'

  pending 'should display the total'

  pending 'should sum total + commission'

  pending 'should include commission (total - commission)'

  pending 'should display the commission'
end
