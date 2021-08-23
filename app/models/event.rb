class Event < ApplicationRecord
  has_many :kurasus, through: :participants
  has_many :students, through: :participants
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true
end
