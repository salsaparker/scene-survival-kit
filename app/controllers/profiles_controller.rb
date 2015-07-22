class ProfilesController < ApplicationController
	layout 'logged_in', except: [:new, :create]
	before_action :authenticate_user!, except: [:index]
	before_action :find_profile, only: [:edit, :update, :show, :destroy]

  def index
		@profiles = Profile.search(params[:search])
	end
	
  def show
  end

  def new
		@profile = Profile.new
  end
	
	def create
		@user = current_user
		@profile = Profile.new(profile_params)
		@profile.user_id = @user.id
		if @profile.save
 			flash[:notice] = "Profile created!"
			redirect_to choose_profile_path
		else
		 	flash[:alert] = "Something went wrong. Please try again."
			render :new
		end
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
		@profile = Profile.find_by_user_id(params[:id])
	end

	def profile_params
		params.require(:profile).permit(:image, :name, :bio, :phone_number, :user_id, :created_at, :updated_at)
	end

end

# :image_file_name, :image_content_type, :image_file_size,

