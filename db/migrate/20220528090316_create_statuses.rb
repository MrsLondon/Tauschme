class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.references :user1, null: true
      t.references :user2, null: true
      t.boolean :liked, default: false
      t.boolean :disliked, default: false

      t.timestamps
    end
    add_foreign_key :statuses, :users, column: :user1_id, primary_key: :id
    add_foreign_key :statuses, :users, column: :user2_id, primary_key: :id
  end
end
