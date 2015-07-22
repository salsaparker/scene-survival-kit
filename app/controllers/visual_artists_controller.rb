class VisualArtistsController < ApplicationController
	layout 'logged_in', except: [:new, :create]
	before_action :authenticate_user!
	before_action :find_visual_artist, only: [:edit, :show, :update, :destroy]

  def index
		@visual_artists = VisualArtist.all
  end

	def show
  end

  def new
		@visual_artist = VisualArtist.new
		@visual_artist.addresses.build
  end

	def create
		@profile = current_user.profile
		@visual_artist = VisualArtist.new(visual_artist_params)
		@visual_artist.profile_id = @profile.id
		if @visual_artist.save
			address = Address.new(zip: params[:visual_artist][:addresses_attributes]['0'][:zip].to_i, 
									street: params[:visual_artist][:addresses_attributes]['0'][:street],
									city: params[:visual_artist][:addresses_attributes]['0'][:city],
									state: params[:visual_artist][:addresses_attributes]['0'][:state],
									visual_artist_id: @visual_artist.id
									)
			address.save
			flash[:notice] = "New visual artist saved!"
			redirect_to welcome_path
		else
			flash[:error] = "Something went wrong. Please try again."
			render :new
		end
	end

  def edit
  end

	def update
		if @visual_artist.update(visual_artist_params)
			flash[:notice] = "Visual Artist updated"
			redirect_to visual_artists_path
		else
			flash[:error] = "Something went wrong. Please try again."
			render :edit	
		end
	end

	def destroy
		@visual_artist.destroy
		redirect_to visual_artists_path
	end

	private

	def find_visual_artist
		@visual_artist = VisualArtist.find(params[:id])
	end

	def visual_artist_params
		params.require(:visual_artist).permit(:medium, :profile_id, addresses_attributes: [:id, :street, :city, :state, :zip, :visual_artist_id, :latitude, :longitude])
	end
end
