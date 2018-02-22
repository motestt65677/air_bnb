class AddDefaultValuesToListings < ActiveRecord::Migration[5.1]
  def change
  	change_column_default(:listings, :amenities, [])
  end
end
