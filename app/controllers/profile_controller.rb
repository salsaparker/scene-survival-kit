class ProfileController < ApplicationController
  before_action :authenticate_user!
  before_action :find_by, only:[:edit, :show, :update, :destroy]
  belongs_to :user
  has_one :musician
  has_one :visual_artist
  has_one :venue_rep

  def index
    @profile = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
  end

  def show
    @profile =Profile.where(user_id: @profile.id)
  end

  def edit

  end

  def update
  if @profile.update(profile_params)
    redirect_to profile_path
  else
    render :edit
    flash[:error] = "Somthing went wrong, please refresh and try again"
    end
  end

  def destroy
    @profile.destroy
    redirect_to new_profile_path
    flash[:notice] = "Profile successfully removed"
  end

  private

  def find_by
    @profile = Profile.find_by(id: params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, :phone_number)
  end

end
