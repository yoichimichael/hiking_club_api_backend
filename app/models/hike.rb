class Hike < ApplicationRecord
  has_many :participations
  has_many :members, through: :participations
  has_many :comments
end
