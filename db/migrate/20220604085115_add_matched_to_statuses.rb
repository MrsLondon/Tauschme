class AddMatchedToStatuses < ActiveRecord::Migration[6.1]
  def change
    add_column :statuses, :matched, :boolean, default: false
    add_column :statuses, :is_ongoing, :boolean, default: true
  end
end
