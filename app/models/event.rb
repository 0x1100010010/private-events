class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :event_enrolments
  has_many :attendee, through: :event_enrolments, source: :user

  scope :upcoming_events, -> { where('date > ?', Time.now) }
  scope :past_events, -> { where('date <= ?', Time.now) }
end