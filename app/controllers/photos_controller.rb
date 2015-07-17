class PhotosController < ApplicationController
before_action :find_profile, only: [:edit, :update, :show, :destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.create(photo_params)
    if @photo.save
      flash[:success]= "Photo created!"
      redirect_to profile_path(@photo.profile_id)
    else
      flash[:error]= "Photo failed to create!"
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      flash[:success]= "Photo updated!"
      redirect_to profile_path(@photo.profile_id)
    else
      flash[:error]= "Photo failed to update!"
      render :edit
    end
  end

  def show
  end

  def destroy
    @photo.destroy
  end

  private

  def find_profile
    @photo = Photo.find_by(params[:id])
    unless @photo
      render(text: "We couldn't find the photo you wanted.", status: :not_found)
    end
  end

  def photo_params
    params.require(:photo).permit(:caption, :image, :profile_id)
  end
end
