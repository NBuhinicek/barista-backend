class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :street, null: false
      t.integer :street_number, null: false
      t.integer :zip_code, null: false
      t.string :county, null: false
      t.string :country, null: false
      t.string :coordinates, null: false

      t.timestamps
    end
  end
end
