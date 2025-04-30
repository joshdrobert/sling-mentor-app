class StudentSpecialty < ApplicationRecord
  belongs_to :student
  belongs_to :specialty

  # Optional: Prevent duplicate associations
  validates_uniqueness_of :student_id, scope: :specialty_id
end