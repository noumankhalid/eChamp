class Event < ActiveRecord::Base
  has_many :tickets
  has_many :events_attendees
  has_many :attendees, :through => :events_attendees

  belongs_to :user
end
