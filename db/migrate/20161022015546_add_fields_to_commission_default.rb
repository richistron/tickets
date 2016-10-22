class AddFieldsToCommissionDefault < ActiveRecord::Migration[5.0]
  def change
    add_reference :commission_defaults, :payment_method, foreign_key: true
    add_column :commission_defaults, :amount, :float
    add_column :commission_defaults, :is_percentage, :boolean
  end
end
