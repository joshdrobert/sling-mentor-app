class StudentBoardLead < ApplicationRecord
  belongs_to :student
  belongs_to :board_lead, class_name: 'User'
end
