class CommentsController < ApplicationController
  before_action :set_question
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @question.comments.build(comment_params)
    @comment.user = current_user


    mentioned_users = @comment.content.scan(/@(\w+)/).flatten
    if mentioned_users.any?
      first_mentioned_user = mentioned_users.first
      username = first_mentioned_user.sub('@', '')
      
      # Check if the first mention is the commenter's own name (first_name, last_name)
      if username == current_user.email.split('@').first
        render json: { errors: ["You cannot reply to yourself"] }, status: :unprocessable_entity
        return
      end
    end


    if current_user.present? && @comment.save  
      @question.increment!(:comment_count)
      redirect_to question_path(@question), notice: 'Comment was successfully created.'
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user == @comment.user || current_user&.isAdmin == true
      if @comment.destroy
        @question.decrement!(:comment_count)
        redirect_to question_path(@question), notice: 'Comment was successfully deleted.'
      else
        redirect_to question_path(@question), alert: 'Failed to delete the comment.'
      end
    else
      redirect_to question_path(@question), alert: 'You are not authorized to delete this comment.'
    end
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to questions_path, alert: 'Question not found.'
  end

  def set_comment
    @comment = @question.comments.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to question_path(@question), alert: 'Comment not found.'
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
