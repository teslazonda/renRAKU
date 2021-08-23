class CreateKurasus < ActiveRecord::Migration[6.0]
  def change
    create_table :kurasus do |t|
      t.string :name
      t.integer :class_year
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
