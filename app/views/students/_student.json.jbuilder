json.extract! student, :id, :user_id, :gradYear, :semester, :team, :created_at, :updated_at
json.url student_url(student, format: :json)
