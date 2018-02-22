class AddForeignKeyTrue < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :reservations, :users, foreign_key: true
    add_foreign_key :reservations, :listings, foreign_key: true
  end
end
