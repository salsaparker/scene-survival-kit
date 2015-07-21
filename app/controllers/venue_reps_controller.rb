class VenueRepsController < ApplicationController
	
# before_action :authenticate_user!
before_action :find_venue_rep, only: [:edit, :show, :update, :destroy]

  def index
		@venue_reps = VenueRep.all
  end

  def show
  end

  def new
		@venue_rep = VenueRep.new
		@venue_rep.address.build
  end

	def create
		@profile = current_user.profile
		@venue_rep = VenueRep.new(venue_rep_params)
		@venue_rep.profile_id = @profile.id
		if @venue_rep.save
			flash[:notice] = "Venue Representative Created!"
			redirect_to welcome_path
		else
			flash[:alert] = "Something went wrong. Please try again."
			render :new
		end
	end

  def edit
  end

	def update
		if @venue_rep.update(venue_rep_params)
			flash[:notice] = "Venue Representative Updated!"
			redirect_to venue_rep_path(VenueRep.id)
		else
			flash[:alert] = "Something went wrong. Please try again."
			render :edit
		end
	end

	def destroy
		@venue_rep.destroy
		redirect_to venue_reps_path
	end

private

	def find_venue_rep
		@venue_rep = VenueRep.find(params[:id])
	end

	def venue_rep_params
		params.require(:venue_rep).permit(:profile_id, address_attributes: [:id, :street, :city, :state, :zip, :musician_id, :latitude, :longitude])
	end

end
