class Student < ApplicationRecord
  belongs_to :user, inverse_of: :student
  belongs_to :mentor_type, optional: true  # Make it optional if students might not have a mentor type
  accepts_nested_attributes_for :user
  enum classification: { Freshman: "Freshman", Sophomore: "Sophomore", Junior: "Junior", Senior: "Senior", Graduate: "Graduate" }
  has_many :student_board_leads
  has_many :student_em_med_mentors
  has_many :student_specialties, dependent: :destroy
  has_many :specialties, through: :student_specialties
end