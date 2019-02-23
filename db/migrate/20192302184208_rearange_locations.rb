class RearangeLocations < ActiveRecord::Migration[5.2]
  def up
    remove_column :locations, :street_number
  end
end
