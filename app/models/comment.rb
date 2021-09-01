class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :message
  validates :content, presence: true
  enum status: { read: "read", unread: "unread" }
end
