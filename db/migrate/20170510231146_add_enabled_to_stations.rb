class AddEnabledToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :enabled, :boolean
  end
end
