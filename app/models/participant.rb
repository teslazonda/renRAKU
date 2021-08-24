class Participant < ApplicationRecord
  belongs_to :kurasu
  belongs_to :event
  # belongs_to :student, optional: true
  # todo: For now, a participant only has a kurasu
end
