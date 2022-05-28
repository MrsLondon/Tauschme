class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :apartment, null: false, foreign_key: true
      t.boolean :liked, default: false
      t.boolean :disliked, default: false

      t.timestamps
    end
  end
end
