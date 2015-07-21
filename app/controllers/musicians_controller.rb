class MusiciansController < ApplicationController


# before_action :authenticate_user!
before_action :find_musician, only: [:edit, :show, :update, :destroy]

  def index
		@musicians = Musician.all
  end

	def show
  end

  def new
		@musician = Musician.new
  end

	def create 
		@profile = current_user.profile
		@musician = Musician.new(musician_params)
		@musician.profile_id = @profile.id
		if @musician.save
			flash[:notice] = "Musician created!"
			redirect_to welcome_path
		else
			flash[:alert] = "Something went wrong. Please try again."
			render :new
		end
	end

  def edit
  end

	def update
		if @musician.update(musician_params)
			flash[:notice] = "Musician updated!"
			redirect_to musicians_path
		else
			flash[:alert] = "Something went wrong. Please try again."
			render :edit
		end
	end

	def destroy
		@musician.destroy
		redirect_to musicians_path
	end

private

	def find_musician
		@musician = Musician.find_by_id(params[:id])
	end

	def musician_params
		params.require(:musician).permit(:instrument, :genre, :profile_id, :created_at, :updated_at, addresses_attributes: [:id, :street, :city, :state, :zip, :musician_id, :latitude, :longitude])
	end

end
