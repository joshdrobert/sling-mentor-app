# app/jobs/daily_comment_summary_job.rb
class SendDailyCommentNotificationJob < ApplicationJob  
  queue_as :default
  
  def perform
    # Get all the questions or posts that have comments/replies
    questions_with_new_comments = Question.includes(:comments)
                                          .where('comments.created_at > ?', 1.day.ago)
                                          .where('comments.user_id != questions.user_id')  # Ensure there is at least one comment that isn't from the post creator
                                          .references(:comments)
 
    # Iterate through each question and send a daily summary email to the users
    questions_with_new_comments.each do |question|
      # Send the daily summary email to the question's owner
      NotificationMailer.daily_comment_summary(question).deliver_now
     
      # Iterate through each comment to check for "@username" and time range
      question.comments.where('created_at > ?', 1.day.ago).each do |comment|
        # Use a set to track unique users who have been mentioned
        mentioned_users = Set.new
     
        comment.content.scan(/@(\w+)/).each do |username_match|
          # Remove the '@' symbol
          username = username_match.first.sub('@', '')
        
          # Only process the mention if it hasn't been processed before
          unless mentioned_users.include?(username)
            mentioned_users.add(username)
        
            # Find the user by username (assuming 'username' is a column in the User model)
            user = User.find_by(email: username + "@gmail.com")
            if user
              # Send a notification email to the mentioned user
              NotificationMailer.mention_notification(user, comment, question).deliver_now
            end
          end
        end
        
      end
    end
  end
end