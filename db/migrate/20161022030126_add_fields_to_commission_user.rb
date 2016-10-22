class AddFieldsToCommissionUser < ActiveRecord::Migration[5.0]
  def change
    add_column :commission_users, :amount, :float
    add_column :commission_users, :is_percentage, :boolean
    add_reference :commission_users, :user, foreign_key: true
    add_reference :commission_users, :payment_method, foreign_key: true
  end
end
