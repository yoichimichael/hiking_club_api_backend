class Member < ApplicationRecord
  has_many :participations
  has_many :hikes, through: :participation
  validates :username, presence: true 
end
