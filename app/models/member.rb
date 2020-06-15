class Member < ApplicationRecord
  has_many :participations
  has_many :hikes, through: :participations
  has_many :comments
  # validates :username, presence: true 
end
