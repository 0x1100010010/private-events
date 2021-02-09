class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :event_enrolments
  has_many :attendees, through: :event_enrolments, source: :user

  scope :upcoming_events, -> { where('date > ?', Date.current) }
  scope :ongoing_events, -> { where('date == ?', Date.current) }
  scope :past_events, -> { where('date < ?', Date.current) }
end