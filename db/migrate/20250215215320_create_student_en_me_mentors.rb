class CreateStudentEnMeMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :student_en_me_mentors do |t|
      t.references :student, null: false, foreign_key: true
      t.references :mentor, null: false, foreign_key: true
      t.timestamps
    end
  end
end
