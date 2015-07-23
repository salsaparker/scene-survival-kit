class VenueRepsController < ApplicationController
	
	layout 'logged_in', except: [:new, :create]
	before_action :authenticate_user!
	before_action :find_venue_rep, only: [:edit, :show, :update, :destroy]

  def index
		@venue_reps = VenueRep.all
  end

  def show
  end

  def new
		@venue_rep = VenueRep.new
		@venue_rep.addresses.build
  end

	def create
		@profile = current_user.profile
		@venue_rep = VenueRep.new(venue_rep_params)
		@venue_rep.profile_id = @profile.id
		if @venue_rep.save
			address = Address.new(zip: params[:venue_rep][:addresses_attributes]['0'][:zip].to_i, 
									street: params[:venue_rep][:addresses_attributes]['0'][:street],
									city: params[:venue_rep][:addresses_attributes]['0'][:city],
									state: params[:venue_rep][:addresses_attributes]['0'][:state],
									venue_rep_id: @venue_rep.id
									)
			address.save
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
		params.require(:venue_rep).permit(:profile_id, addresses_attributes: [:id, :street, :city, :state, :zip, :venue_rep_id, :latitude, :longitude])
	end

end
