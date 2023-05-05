class CreateQuakes < ActiveRecord::Migration[7.0]
  def change
    create_table :quakes do |t|
      t.datetime :datetime
      t.float :latitude
      t.float :longitude
      t.float :depth
      t.float :magnitude
      t.string :mag_type
      t.integer :nb_stations
      t.integer :gap
      t.float :distance
      t.float :rms
      t.string :source
      t.string :event_id

      t.timestamps
    end
  end
end
