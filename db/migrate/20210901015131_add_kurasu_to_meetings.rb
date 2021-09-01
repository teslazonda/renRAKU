class AddKurasuToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_reference :meetings, :kurasu, null: false, foreign_key: true
  end
end
