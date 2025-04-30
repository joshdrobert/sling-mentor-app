class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email, null: false
      t.string :role            # e.g. 'student', 'mentor', 'admin', 'library', etc.
      t.string :library         # If you need to store a library name or ID
      t.string :image
      t.timestamps              # includes created_at, updated_at
      t.boolean :isAdmin, default: false

    end

    add_index :users, :email, unique: true
  end
end