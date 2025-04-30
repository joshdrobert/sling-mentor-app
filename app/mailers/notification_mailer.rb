# app/mailers/notification_mailer.rb
class NotificationMailer < ApplicationMailer
  def daily_comment_summary(question)
    @question = question
    @comments = question.comments.where('created_at > ?', 1.day.ago).limit(5)
    mail(to: @question.user.email, subject: "Your daily comment summary")
  end
  
  def mention_notification(user, comment, question)
    @user = user  # user mentioned
    @question = question
    @comment = comment
    mail(to: @user.email, subject: "Someone replied to your comment")
  end

  def daily_mentor_notification(user)
    @user = user
    mail(to: @user.email, subject: "Someone asked a question related to your mentor field")
  end
end