class VisualArtistsController < ApplicationController
before_action :find_va, only: [:edit, :update, :show, :destroy]

  def index
    @visual_artists = VisualArtist.all
  end

  def new
    @visual_artist = VisualArtist.new
  end

  def create
    @visual_artist = VisualArtist.create(va_params)
    if @visual_artist.save
      flash[:success]= "Welcome!"
      redirect_to profile_path(@visual_artist.profile_id)
    else
      flash[:error]= "Something went wrong!"
      render :new
    end
  end

  def edit
  end

  def update
    if @visual_artist.update
      flash[:success]= "Profile updated!"
      redirect_to profile_path(@visual_artist.profile_id)
    else
      flash[:error]= "Something went wrong!"
      render :edit
    end
  end

  def show    
  end

  def destroy
    @visual_artist.destroy
  end

  private

    def find_va
      @visual_artist = VisualArtist.find_by(id: params[:id])
    end

    def va_params
      params.require(:visual_artist).require(:medium, :profile_id)
    end
end
