class AddPriceToListings < ActiveRecord::Migration[5.1]
  def change
  	add_column :listings, :price, :float
  	change_column_default(:listings, :price, 0)
  end
end
