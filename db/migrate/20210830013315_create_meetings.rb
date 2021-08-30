class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :title
      t.text :content
      t.date :date
      t.integer :hour
      t.references :parent, foreign_key: { to_table: :users }
      t.references :teacher, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
