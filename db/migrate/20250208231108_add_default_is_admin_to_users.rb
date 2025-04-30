class AddDefaultIsAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :isAdmin, false
  end
end
