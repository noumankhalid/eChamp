class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.integer :user_id
      t.integer :event_id
      t.integer :cost
      t.string :type
      t.string :attendee
      t.text :barcode
      t.string :design

      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
