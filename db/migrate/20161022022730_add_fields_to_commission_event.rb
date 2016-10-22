class AddFieldsToCommissionEvent < ActiveRecord::Migration[5.0]
  def change
    add_reference :commission_events, :payment_method, foreign_key: true
    add_column :commission_events, :amount, :float
    add_column :commission_events, :is_percentage, :boolean
    add_reference :commission_events, :event, foreign_key: true
  end
end
