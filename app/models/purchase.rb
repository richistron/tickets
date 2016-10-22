class Purchase < ApplicationRecord
  belongs_to :payment_method
  belongs_to :event
  validates_presence_of :amount
  validates_numericality_of :amount
  validate :commission_price_validation

  def ticket_cost
    event.ticket_cost
  end

  def fee_included?
    event.fee_included
  end

  def payment_method_name
    payment_method.name
  end

  def commission_fee
    if get_commission.is_percentage
      ticket_cost * get_commission.amount * 100
    else
      get_commission.amount
    end
  end

  def total_amount
    if fee_included?
      ticket_cost - commission_fee
    else
      ticket_cost + commission_fee
    end
  end


  private
  def commission_price_validation
    return if event.nil? || payment_method.nil?
    if total_amount != amount
      errors.add :amount, 'total amount does not match with the ticket price'
    end
  end

  def get_commission
    return commission_event if commission_event
    return commission_user if commission_user
    return commision_default if commision_default
  end

  def commission_event
    CommissionEvent.find_by event_id: event.id, payment_method_id: payment_method.id
  end

  def commision_default
    CommissionUser.find_by user_id: user.id
  end

  def commission_user
    CommissionDefault.find_by  payment_method_id: payment_method.id
  end

  def user
    event.user
  end
end
