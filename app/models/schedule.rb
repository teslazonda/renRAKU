class Schedule < ApplicationRecord
  belongs_to :kurasu
  has_one_attached :photo
end
