class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.text :content
      t.string :type
      t.references :kurasu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
