class RemoveTitleFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :title, :string
  end
end
