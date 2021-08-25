class Event < ApplicationRecord
  has_many :participants, dependent: :destroy
  has_many :kurasus, through: :participants
  has_many :students, through: :participants
  validates :title, presence: true
  validates :rich_body, presence: true
  validates :date, presence: true


  accepts_nested_attributes_for :participants, reject_if: proc { |attributes| attributes['kurasu_id'].blank? }

  has_rich_text :rich_body

  has_one_attached :photo
end
