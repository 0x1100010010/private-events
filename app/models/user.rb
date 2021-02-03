class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
end
