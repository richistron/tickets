class CreateEventBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :event_books do |t|

      t.timestamps
    end
  end
end
