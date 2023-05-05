class AddCacheToQuakes < ActiveRecord::Migration[7.0]
  def change
    add_column :quakes, :cache, :string
  end
end
