class ChangeEventsContentToRichBody < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :content, :rich_body
  end
end
