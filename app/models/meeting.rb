class Meeting < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  validates :date, presence: true
  validates :parent_id, presence: true
end
