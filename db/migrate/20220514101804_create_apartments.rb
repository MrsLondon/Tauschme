class CreateApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartments do |t|
      t.string :title
      t.integer :room
      t.string :area
      t.integer :rent
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
