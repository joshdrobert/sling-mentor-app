class CreateMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :mentors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :mentor_type, foreign_key: true
      t.references :specialty, foreign_key: true
      t.string :profession
      t.timestamps
    end
  end
end