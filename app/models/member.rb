class Member < ApplicationRecord
  # has_secure_password

  has_many :participations
  has_many :hikes, through: :participations
  has_many :comments
  has_many :hosted_hikes, foreign_key: 'host_id', class_name: 'Hike'
  
  # validates :username, presence: true 
end
