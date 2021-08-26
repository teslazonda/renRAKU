class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :message
  belongs_to :user, through: :messages
  validates :content, presence: true
end
