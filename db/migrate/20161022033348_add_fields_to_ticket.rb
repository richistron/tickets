class AddFieldsToTicket < ActiveRecord::Migration[5.0]
  def change
    add_reference :tickets, :purchase, foreign_key: true
    add_reference :tickets, :event, foreign_key: true
  end
end
