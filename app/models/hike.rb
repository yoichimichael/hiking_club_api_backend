class Hike < ApplicationRecord
  has_many :participations
  has_many :members, through: :participations
  has_many :comments
  belongs_to :host, class_name: "Member"
end
