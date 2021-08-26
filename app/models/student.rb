class Student < ApplicationRecord
  has_many :events, through: :participants
  has_many :messages
  belongs_to :kurasu
  belongs_to :user
  # belongs_to :user, through: :kurasus
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true
  validates :student_number, presence: true
end
