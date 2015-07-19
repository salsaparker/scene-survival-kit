class VisualArtistsController < ApplicationController
	# before_action :authenticate_user!
	before_action :find_visual_artist, only: [:edit, :show, :update, :destroy]

  def index
		@visual_artists = VisualArtist.all
  end

	def show
  end

  def new
		@visual_artist = VisualArtist.new
		@visual_artist.address.build
  end

	def create
		@visual_artist = VisualArtist.new(visual_artist_params)
		if @visual_artist.save
			flash[:notice] = "New visual artist saved!"
			redirect_to visual_artists_path
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
		params.require(:visual_artist).permit(:medium, :profile_id)
	end
end
