class Student < ApplicationRecord
  has_many :events, through: :participants
  has_many :messages
  has_many :grades, dependent: :destroy
  belongs_to :kurasu
  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :student_number, presence: true
end
