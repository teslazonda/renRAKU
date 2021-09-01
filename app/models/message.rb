class Message < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :student
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true
  enum status: { read: "read", unread: "unread" }

  has_one_attached :photo
end
