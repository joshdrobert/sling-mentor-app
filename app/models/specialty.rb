# app/models/specialty.rb
class Specialty < ApplicationRecord
  belongs_to :mentor_type
  has_many :mentor_specialties
  has_many :mentors, through: :mentor_specialties
  has_many :student_specialties
  has_many :students, through: :student_specialties

  # Ensure we can query by mentor_type_id
  scope :by_mentor_type, ->(mentor_type_id) { where(mentor_type_id: mentor_type_id) }

  validates :name, presence: true
  validates :mentor_type, presence: true
end