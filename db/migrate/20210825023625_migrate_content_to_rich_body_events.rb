class MigrateContentToRichBodyEvents < ActiveRecord::Migration[6.0]
  def up
    Event.find_each do |event|
      event.update(rich_body: event.content)
    end
  end

  def down
    Event.find_each do |event|
      event.update(content: event.rich_body)
      event.update(rich_body: nil)
    end
  end
end
