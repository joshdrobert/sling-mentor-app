class QuestionsController < ApplicationController
  before_action :set_question, only: [:destroy, :update, :edit]
  def edit
    if !current_user.present? || current_user != @question.user
      redirect_to question_path(@question), alert: "You are not authorized to edit this question."
    end
  end
  
  def index
    @questions = Question.paginate(page: params[:page], per_page: 12)

    if params[:mentorType].present? && params[:mentorType] != "All mentor types" && !params[:mentorType].strip.empty?
      mentor_type = MentorType.find_by(name: params[:mentorType])
      @questions = @questions.where(mentor_type_id: mentor_type.id) if mentor_type
    end

    if params[:specialty].present? && params[:mentorType].present? && params[:specialty] != "All specialties" && !params[:specialty].strip.empty?
      specialty = Specialty.find_by(name: params[:specialty])

      @questions = @questions.where(specialty_id: specialty.id) if specialty
    end

    @questions = case params[:sortBy]
                when "Newest" then @questions.order(updated_at: :desc)
                when "Oldest" then @questions.order(updated_at: :asc)
                when "Most comments" then @questions.order(comment_count: :desc)
                when "Least comments" then @questions.order(comment_count: :asc)
                else @questions.order(updated_at: :desc) # Default to newest
                end
  end

  def update
    # Log the full params for debugging
  
    # Check if the question exists
    return redirect_to questions_path, alert: 'Question not found.' unless @question
    
    # Early return if there are comments
    if @question.comment_count.to_i > 0 
      return redirect_to questions_path, notice: 'Question was commented on.'
    end
    
    # Extract nested params safely
    
    question_params = params.require(:question)

    changes = {
    question: @question.question != question_params[:question],
    description: @question.description != question_params[:description],
    mentor_type: @question.mentor_type&.short_name != question_params[:mentor_type],
    specialty: @question.specialty&.name != question_params[:specialty]
  }

    # If no changes, redirect back with a notice
    if changes.values.none?
      redirect_to question_path(@question), notice: 'No changes were made.'
      return
    end
    # Find associated models
    mentor_type = MentorType.find_by(short_name: question_params[:mentor_type])
    specialty = Specialty.find_by(name: question_params[:specialty]) if question_params[:specialty]
  
    # Update attributes
    @question.question = question_params[:question]
    @question.description = question_params[:description]
    @question.mentor_type = mentor_type
    @question.specialty = specialty if specialty
  
    # Attempt to save
    if @question.save
      redirect_to question_path(@question), notice: 'Question was successfully updated.'
    else
      # Log validation errors if save fails
      Rails.logger.debug "Save Errors: #{@question.errors.full_messages}"
      render :edit
    end
  end

  def destroy

    if current_user == @question.user || current_user&.isAdmin == true
      @question.destroy
      respond_to do |format|
        format.html { redirect_to questions_path, notice: "Question was successfully deleted." }
        format.json { head :no_content } # For AJAX requests
      end
    else
      redirect_to questions_path, alert: "You are not authorized to delete this question."
    end
  end

  def show
    @questions = Question.includes(:comments).all
    @question = Question.find(params[:id])
  end

  def create

    unless current_user
      redirect_to questions_path, alert: "You must be logged in to post a question."
      return
    end
    @question = Question.new(
      question: params[:question],
      description: params[:description],
      comment_count: 0,
      mentor_type: MentorType.find_by(short_name: params[:mentor_type]),
    )
    if params[:specialty].present?
      specialty = Specialty.find_by(short_name: params[:specialty])
      @question.specialty = specialty if specialty
    end
    @question.user = current_user
    if @question.save
       redirect_to questions_path, notice: "Question submitted successfully!"
    else
      Rails.logger.debug "Error not saved"
      render :index # or :show based on your view
    end
  end

  private
  def set_question
    @question = Question.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to questions_path, alert: "Question not found."
  end

  # Remove the form_params method since we're directly accessing params

end