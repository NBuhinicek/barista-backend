class RemoveConstraintOnCoordinates < ActiveRecord::Migration[5.2]
  def up
    change_column :locations, :coordinates, :string, null: true
  end

  def down
    change_column :locations, :coordinates, :string, null: false
  end
end
