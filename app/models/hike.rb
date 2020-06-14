class Hike < ApplicationRecord
  has_many :participation
  has_many :members, through: :participation
end
