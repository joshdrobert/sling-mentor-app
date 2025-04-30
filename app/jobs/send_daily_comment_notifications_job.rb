# app/jobs/daily_comment_summary_job.rb
class SendDailyCommentNotificationsJob < ApplicationJob  
  queue_as :default
  
  def perform
    # Get all the questions or posts that have comments/replies
    questions_with_new_comments = Question.includes(:comments)
                                          .where('comments.created_at > ?', 1.day.ago)
                                          .references(:comments)
 
    # Iterate through each question and send a daily summary email to the users
    questions_with_new_comments.each do |question|
      # Send the daily summary email to the question's owner
      NotificationMailer.daily_comment_summary(question).deliver_now
     
      # Iterate through each comment to check for "@username" and time range
      question.comments.where('created_at > ?', 1.day.ago).each do |comment|
        # Use a set to track unique users who have been mentioned
        mentioned_users = Set.new
     
        # Check if the comment text contains a username preceded by "@"
        comment.text.scan(/@(\w+_\w+)/).each do |username_match|
          # Split the username into first name and last name
          first_name, last_name = username_match.first.split('_')
     
          # Only process the mention if it hasn't been processed before
          unless mentioned_users.include?(username_match.first)
            mentioned_users.add(username_match.first)
     
            # Find the user by first name and last name
            user = User.find_by(first_name: first_name, last_name: last_name)
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