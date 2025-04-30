class MentorsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :set_mentor, only: %i[show edit update destroy]
  before_action :authorize_mentor, only: %i[edit update destroy]
  protect_from_forgery except: :search
  
  MENTORS_PER_PAGE = 9

  def index
    @mentors = Mentor.all.paginate(page: params[:page], per_page: MENTORS_PER_PAGE)
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @mentor.update(mentor_params)
        # Handle specialties
        specialty_ids = params[:mentor][:specialty_ids]
  
        # Ensure specialty_ids is an array before calling `reject`
        specialty_ids = specialty_ids.is_a?(String) ? specialty_ids.split(',') : specialty_ids
        specialty_ids = specialty_ids.reject(&:blank?)
  
        # Convert to integers
        @mentor.specialty_ids = specialty_ids.map(&:to_i)
  
        format.html { 
          # Check if request came from admin page
          if request.referer&.include?('/admin/') && current_user.isAdmin?
            redirect_to admin_path(@mentor.user), notice: 'Mentor was successfully updated.'
          else
            redirect_to user_path(@mentor.user), notice: 'Mentor was successfully updated.'
          end
        }
        format.json { render :show, status: :ok, location: @mentor }
      else
        format.html { render :edit }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mentor.destroy
    redirect_to mentors_path, notice: 'Mentor was successfully destroyed.'
  end

  def search
    query = params[:query].to_s.downcase.strip
    search_type = params[:search_type]
    mentor_type_id = params[:mentor_type]
    specialty_ids = Array(params[:specialty]).reject(&:blank?)
  
    @mentors = Mentor.joins(:user)
  
    if search_type == 'name' && query.present?
      names = query.split(/\s+/, 2)
      if names.length == 2
        first_name, last_name = names
        @mentors = @mentors.where(
          'LOWER(users.first_name) LIKE ? AND LOWER(users.last_name) LIKE ?',
          "%#{first_name}%", "%#{last_name}%"
        )
      else
        @mentors = @mentors.where(
          'LOWER(users.first_name) LIKE ? OR LOWER(users.last_name) LIKE ?',
          "%#{query}%", "%#{query}%"
        )
      end
    elsif search_type == 'profession'
      @mentors = @mentors.where('LOWER(mentors.profession) LIKE ?', "%#{query}%")
    end
  
    @mentors = @mentors.where(mentor_type_id: mentor_type_id) if mentor_type_id.present? && mentor_type_id != "all"
  
    if specialty_ids.present? && specialty_ids != ["all"]
      @mentors = @mentors.joins(:mentor_specialties)
                         .where(mentor_specialties: { specialty_id: specialty_ids })
                         .group('mentors.id')
                         .having('COUNT(DISTINCT mentor_specialties.specialty_id) = ?', specialty_ids.count)
    end
  
    @mentors = @mentors.paginate(page: params[:page], per_page: MENTORS_PER_PAGE)
  
    respond_to do |format|
      format.html { render "index" }  # Ensure a fallback for non-AJAX requests
      format.js   { render partial: 'mentors_list' }
    end
  end
  
  
  
  

  def specialties
    mentor_type_id = params[:mentor_type_id]
    Rails.logger.debug "Testing specialties for mentor type: #{mentor_type_id}" if Rails.env.development?

    specialties = Specialty.where(mentor_type_id: mentor_type_id).pluck(:id, :name)
    Rails.logger.debug "Specialties fetched: #{specialties.inspect}" if Rails.env.development?

    render json: { specialties: specialties.map { |id, name| { id: id, name: name } } }
  end

  private

  private

  def set_mentor
    @mentor = Mentor.find(params[:id])
  end

  def authorize_mentor
    unless @mentor.user == current_user || current_user.isAdmin?
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def mentor_params
    permitted_params = params.require(:mentor).permit(
      :profession, 
      :mentor_type_id, 
      :location,
      user_attributes: [:id, :first_name, :last_name, :email, :phone_number]
    )
    
    # Only allow admin params if current user is admin
    if current_user.isAdmin?
      permitted_params[:user_attributes][:isAdmin] = params[:mentor][:user_attributes][:isAdmin] if params[:mentor][:user_attributes]
    end
    
    permitted_params
  end

  def authenticate_user!
    unless session[:user_id].present?
      redirect_to '/auth/google_oauth2', alert: 'You must be logged in to view mentors.'
    end
  end
end