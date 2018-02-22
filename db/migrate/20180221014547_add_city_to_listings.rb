class AddCityToListings < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :city, :string
    add_index :listings, :user_id
    add_index :reservations, :user_id
    add_index :reservations, :listing_id
    
  end
end
