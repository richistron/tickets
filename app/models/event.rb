class Event < ApplicationRecord
  belongs_to :user
  validates_presence_of :title, :description, :amount_of_tickets, :ticket_cost
  validates_inclusion_of :fee_included, :in => [true, false]
end
