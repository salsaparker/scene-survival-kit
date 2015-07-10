class ProfilesController < ApplicationController

before_action :find_profile, only: [:edit, :update, :show, :destroy]

  def index
		@profiles = Profiles.all
  end

  def show
  end

  def new
		@profile = Profile.new
  end
	
	def create
		if @profile.save(profile_params)
			flash[:notice] = "Profile created!"
			redirect_to profiles_path
		else
		 	flash[:alert] = "Something went wrong. Please try again."
			render :new
	end

  def edit
  end

	def update
		if @profile.update(profile_params)
			flash[:notice] = "Profile updated!"
			redirect_to profiles_path
		else
			flash[:alert] = "Something went wrong. Please try again."
			render :edit
		end
	end

	def destroy
		@profile.destroy
		redirect_to profiles_path
	end

private

	def find_profile
		@profile = Profile.find(params[:id])
	end

	def profile_params
		params.require(:profile).permit(:name, :bio, :phone_number, :user_id, 
		:created_at, :updated_at)
	end

end
