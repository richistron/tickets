class CreateCommissionEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :commission_events do |t|

      t.timestamps
    end
  end
end
