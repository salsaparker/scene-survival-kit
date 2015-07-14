class VenueRepsController < ApplicationController

# before_action :authenticate_user!
before_action :find_venue_rep, only: [:edit, :show, :update, :destroy]

  def index
		@venue_reps = Venue_rep.all
  end

  def show
  end

  def new
		@venue_rep = Venue_rep.new
  end

	def create
		@venue_rep = Venue_rep.new(venue_rep_params)
		if @venue_rep.save
			flash[:notice] = "Venue Representative Created!"
			redirect_to venue_reps_path
		else
			flash[:alert] = "Something went wrong. Please try again."
			render :new
		end
	end

  def edit
  end

	def update
		if @venue_rep.upate(venue_rep_params)
			flash[:notice] = "Venue Representative Updated!"
			redirect_to venue_reps_path
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
		@venue_rep = Venue_rep.find_by_id(params[:id])
	end

	def venue_rep_params
		params.require(:venue_rep).permit(:profile_id, :created_at, :updated_at)
	end

end
