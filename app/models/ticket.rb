class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :purchase

  def cost
    purchase.ticket_cost
  end

  def fee_included?
    purchase.fee_included
  end

  def payment_method_name
    purchase.payment_method_name
  end

  def commission_fee
    purchase.commission_fee
  end

  def total_amount
    purchase.total_amount
  end

  def get_commission
    purchase.get_commission
  end

  def profit
    purchase.profit
  end
end
