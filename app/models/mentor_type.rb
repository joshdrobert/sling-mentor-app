class MentorType < ApplicationRecord
  has_many :mentors
  has_many :specialties, through: :mentor_specialties
end
