class CreateMentorSpecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :mentor_specialties do |t|
      t.references :mentor, null: false, foreign_key: true
      t.references :specialty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
