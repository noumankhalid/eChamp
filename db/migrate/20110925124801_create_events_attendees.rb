class CreateEventsAttendees < ActiveRecord::Migration
  def self.up
    create_table :events_attendees do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :events_attendees
  end
end
