class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.integer :amount_of_tickets
      t.float :ticket_cost

      t.timestamps
    end
  end
end
