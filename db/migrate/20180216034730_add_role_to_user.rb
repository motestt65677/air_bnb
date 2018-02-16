class AddRoleToUser < ActiveRecord::Migration[5.1]
  def up
		add_column :users, :role, :integer
  end
end
