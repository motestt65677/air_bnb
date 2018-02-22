class AddForeignKey < ActiveRecord::Migration[5.1]
  def change
    add_foreign_key :listings, :users, foreign_key: true
  end
end
