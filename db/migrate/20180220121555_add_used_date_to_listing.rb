class AddUsedDateToListing < ActiveRecord::Migration[5.1]
  def change
    add_column :listings, :used_date, :string, array: true, default: []
  end
end
