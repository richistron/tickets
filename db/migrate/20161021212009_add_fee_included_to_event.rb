class AddFeeIncludedToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :fee_included, :boolean
  end
end
