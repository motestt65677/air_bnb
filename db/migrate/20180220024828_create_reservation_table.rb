class CreateReservationTable < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
    	t.integer :user_id
    	t.integer :listing_id
    	t.float :price
    	t.date :start_date
    	t.date :end_date
    end
  end
end
