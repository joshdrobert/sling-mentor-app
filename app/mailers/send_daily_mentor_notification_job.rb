

class SendDailyMentorNotificationJob < ApplicationJob  
    def perform
        emailed_mentor_ids = Set.new

        # Find questions created within the last 24 hours
        recent_questions = Question.where('created_at > ?', 24.hours.ago)
      
        recent_questions.each do |question|
        #   next unless question.mentor_type_id && question.specialty_id
            next unless question.mentor_type_id
          # Find mentors that match the mentor_type and specialty
            mentors_scope = Mentor.where(mentor_type_id: question.mentor_type_id)
            .includes(:user, :specialties)

            # If question has a specialty, filter mentors who have that specialty
            if question.specialty_id.present?
            mentors_scope = mentors_scope.joins(:specialties)
                            .where(specialties: { id: question.specialty_id })
            end
            mentors_scope.each do |mentor|
                next if mentor.user == question.user
                next if emailed_mentor_ids.include?(mentor.id)
                # Send a notification email to each mentor
                NotificationMailer.daily_mentor_notification(mentor.user).deliver_now
                emailed_mentor_ids.add(mentor.id)
                end
            end
      end
      
  end