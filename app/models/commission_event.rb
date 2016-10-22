class CommissionEvent < ApplicationRecord
  belongs_to :payment_method
  belongs_to :event
  validates_presence_of :amount
  validates_numericality_of :amount
  validates_inclusion_of :is_percentage, :in => [true, false]
end
