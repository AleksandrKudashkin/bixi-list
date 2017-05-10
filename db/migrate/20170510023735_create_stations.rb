class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :name
      t.integer :bikes
      t.float :distance

      t.timestamps
    end
  end
end
