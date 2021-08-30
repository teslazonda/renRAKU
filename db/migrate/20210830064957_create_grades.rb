class CreateGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :grades do |t|
      t.datetime :date
      t.string :subject
      t.string :name
      t.string :value
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
