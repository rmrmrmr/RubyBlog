class ChangeDefaultAdminOnUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:users, :role, 'admin')
  end
end
