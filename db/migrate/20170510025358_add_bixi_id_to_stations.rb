class AddBixiIdToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :bixi_id, :integer
  end
end
