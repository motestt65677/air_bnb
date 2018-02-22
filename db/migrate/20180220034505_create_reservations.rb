class CreateReservations < ActiveRecord::Migration[5.1]
  def change
  	drop_table :reservations

    create_table :reservations do |t|
    	t.integer :user_id
    	t.integer :listing_id
    	t.float :price
    	t.date :start_date
    	t.date :end_date
      t.timestamps
    end
  end
end
