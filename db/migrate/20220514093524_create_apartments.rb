class CreateApartments < ActiveRecord::Migration[6.1]
  def change
    create_table :apartments do |t|
      t.string :title
      t.text :description
      t.integer :room
      t.string :address
      t.integer :rent
      t.integer :size

      t.timestamps
    end
  end
end
