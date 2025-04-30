class Question < ApplicationRecord
  belongs_to :user
  belongs_to :mentor_type
  belongs_to :specialty, optional: true
  has_many :comments
end
