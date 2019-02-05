class CreateCoffeeShops < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_shops do |t|
      t.belongs_to :user, null: false, index: true, foreign_key: true
      t.belongs_to :location, null: false, foreign_key: true

      t.string :name

      t.integer :number_of_tables
      t.date :paid_till

      t.timestamps
    end
  end
end
