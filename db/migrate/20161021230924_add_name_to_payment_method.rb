class AddNameToPaymentMethod < ActiveRecord::Migration[5.0]
  def change
    add_column :payment_methods, :name, :string
  end
end
