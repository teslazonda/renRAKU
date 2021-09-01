class Meeting < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true
  # validates :parent_id, presence: true
  validates :teacher_id, presence: true
  validates :kurasu_id, presence: true
  enum hour: ['16:00', '17:00', '18:00', '19:00', '20:00']
  # belongs_to :parent, class_name: "User"
  belongs_to :teacher, class_name: "User"
  belongs_to :kurasu
end
