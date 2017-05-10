class AddDefaultToStation < ActiveRecord::Migration[5.1]
  def change
    change_column_default :stations, :enabled, true
  end
end
