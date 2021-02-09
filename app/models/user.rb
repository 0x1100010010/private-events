class User < ApplicationRecord
  validates :name, length: { maximum: 30 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }

  has_many :events
  has_many :event_enrolments
  has_many :attended_event, through: :event_enrolments
end
