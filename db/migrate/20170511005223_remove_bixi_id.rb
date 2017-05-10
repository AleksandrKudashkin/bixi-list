class RemoveBixiId < ActiveRecord::Migration[5.1]
  def up
    remove_column :stations, :bixi_id
  end

  def down
    add_column :stations, :bixi_id, :integer
  end
end
