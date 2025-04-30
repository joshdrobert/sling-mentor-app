class Mentor < ApplicationRecord
  belongs_to :user, inverse_of: :mentor
  belongs_to :mentor_type, optional: true
  accepts_nested_attributes_for :user
  has_many :student_en_me_mentors
  has_many :students, through: :student_en_me_mentors
  has_many :mentor_specialties, dependent: :destroy
  has_many :specialties, through: :mentor_specialties
end