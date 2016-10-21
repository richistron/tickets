class CreateCommissionDefaults < ActiveRecord::Migration[5.0]
  def change
    create_table :commission_defaults do |t|

      t.timestamps
    end
  end
end
