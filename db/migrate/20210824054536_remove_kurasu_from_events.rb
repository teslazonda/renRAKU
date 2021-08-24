class RemoveKurasuFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_reference :events, :kurasu, null: false, foreign_key: true
  end
end
