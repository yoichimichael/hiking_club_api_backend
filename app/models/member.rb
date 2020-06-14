class Member < ApplicationRecord
  has_many :participation
  has_many :hikes, through: :participation
  validates :username, presence: true 
end
