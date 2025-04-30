class AddOmniauthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    # add_column :users, :some_other_field, :string

  end
end
