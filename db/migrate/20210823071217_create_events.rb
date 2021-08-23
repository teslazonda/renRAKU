class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.text :content
      t.string :type

      t.timestamps
    end
  end
end
