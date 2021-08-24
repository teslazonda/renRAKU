class RemoveStudentFromParticipants < ActiveRecord::Migration[6.0]
  def change
    remove_reference :participants, :student, null: false, foreign_key: true
  end
end
