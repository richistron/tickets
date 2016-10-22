class AddFieldsToPurchase < ActiveRecord::Migration[5.0]
  def change
    add_column :purchases, :amount, :float
    add_reference :purchases, :payment_method, foreign_key: true
  end
end
