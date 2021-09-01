class Meeting < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true
  # validates :parent_id, presence: true
  validates :teacher_id, presence: true
  validates :kurasu_id, presence: true
  # belongs_to :parent, class_name: "User"
  belongs_to :teacher, class_name: "User"
  belongs_to :kurasu
end
