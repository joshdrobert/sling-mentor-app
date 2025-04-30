class RemoveSpecialtyFromStudentsAndMentors < ActiveRecord::Migration[7.0]
  def change
    remove_reference :students, :specialty, foreign_key: true
    remove_reference :mentors, :specialty, foreign_key: true
  end
end
