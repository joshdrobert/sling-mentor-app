class MentorSpecialty < ApplicationRecord
  belongs_to :mentor
  belongs_to :specialty

  # Optional: Prevent duplicate associations
  validates_uniqueness_of :mentor_id, scope: :specialty_id
end