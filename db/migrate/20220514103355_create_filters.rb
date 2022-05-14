class CreateFilters < ActiveRecord::Migration[6.1]
  def change
    create_table :filters do |t|
      t.integer :room
      t.string :area
      t.integer :rent
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
