class CreateCoffeeTables < ActiveRecord::Migration[5.2]
  def change
    create_table :coffee_tables do |t|
      t.belongs_to :coffee_shop
      t.integer :table_number
      t.string :qr_code
      t.string :qr_code_hash

      t.timestamps
    end
  end
end
