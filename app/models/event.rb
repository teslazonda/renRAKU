class Event < ApplicationRecord
  has_many :participants
  has_many :kurasus, through: :participants
  has_many :students, through: :participants
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true

  accepts_nested_attributes_for :participants, reject_if: proc { |attributes| attributes['kurasu_id'].blank? }
end
