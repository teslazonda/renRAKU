class Participant < ApplicationRecord
  belongs_to :kurasu
  belongs_to :event
  belongs_to :student
end
