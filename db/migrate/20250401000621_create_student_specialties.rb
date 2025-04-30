class CreateStudentSpecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :student_specialties do |t|
      t.references :student, null: false, foreign_key: true
      t.references :specialty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
