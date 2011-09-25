class CreateEvents < ActiveRecord::Migration
  def self.up
     create_table :events do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.integer :number_of_events
      t.date :start_date
      t.date :end_date
      t.text :restrictions
      t.string :location
      t.string :address
      t.string :web_address
      t.integer :number_of_tickets
      t.string :ticket_type
      t.integer :max_order_tickets
      t.text :keywords
      t.string :discount_code
      t.string :qr_code
      t.boolean :group_event
      t.string :video_link

      t.timestamps
     end
  end

  def self.down
    drop_table :events
  end
end
