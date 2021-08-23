class Kurasu < ApplicationRecord
  has_many :students
  has_many :events, through: :participants
  belongs_to :user
  validates :name, presence: true
  validates :class_year, presence: true
end
