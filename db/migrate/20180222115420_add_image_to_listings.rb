class AddImageToListings < ActiveRecord::Migration[5.1]
  def change
    remove_column :listings, :image
    add_column :listings, :image, :json
  end
end
