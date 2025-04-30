# app/controllers/specialties_controller.rb
class SpecialtiesController < ApplicationController
  def index
    if params[:mentor_type_id].present?
      # Fetch specialties by mentor_type_id directly
      @specialties = Specialty.where(mentor_type_id: params[:mentor_type_id]).distinct
    elsif params[:mentor_name].present?
      # Fetch specialties based on mentor_name
      mentor_type = MentorType.find_by(name: params[:mentor_name])
      if mentor_type
        # Log the found mentor_type and its specialties
        @specialties = Specialty.where(mentor_type_id: mentor_type.id).distinct
      else
        @specialties = []
      end
    else
      # Return empty relation if no parameters are provided
      @specialties = []
    end

    # Log the final specialties list
    Rails.logger.info "Fetched Specialties: #{@specialties.inspect}"

    render json: @specialties.select(:id, :name, :mentor_type_id)
  end

end
