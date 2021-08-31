class Grade < ApplicationRecord
  belongs_to :student
  validates :date, presence: true
  validates :subject, presence: true
  validates :value, presence: true
  validates :student_id, presence: true
end
