# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'csv'

CSV.foreach(Rails.root.join('earthquakes1970-2014.csv'), headers: true) do |row|
  Quake.create!(
    datetime: row['DateTime'],
    latitude: row['Latitude'],
    longitude: row['Longitude'],
    depth: row['Depth'],
    magnitude: row['Magnitude'],
    mag_type: row['MagType'],
    nb_stations: row['NbStations'],
    gap: row['Gap'],
    distance: row['Distance'],
    rms: row['RMS'],
    source: row['Source'],
    event_id: row['EventID']
  )
end
