class CreateProfiles < ActiveRecord::Migration
  def self.up
     create_table :profiles do |t|
      t.integer :user_id
      t.string :hometown
      t.text :interests
      t.text :education
      t.text :biography
      t.string :photo_file_name
      t.string :photo_content_type
      t.string :photo_file_size

      t.timestamps
     end
  end

  def self.down
    drop _table :profiles
  end
end
