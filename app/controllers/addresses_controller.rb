class AddressesController < ApplicationController

# before_action :authenticate_user!
before_action :find_address, only: [:edit, :show, :update, :destroy]
  
	def index
		@addresses = Address.all
  end

  def show
  end

  def new
		@address = Address.new
  end

	def create
		@address = Address.new(address_params)
		if @address.save
			flash[:notice]= "Address created!"
			redirect_to addresses_path
		else
			flash[:error]= "Something went wrong. Please try again."
			render :new
		end
	end

  def edit
  end

	def update
		if @address.update(address_params)
			flash[:notice]= "Address updated!"
			redirect_to addresses_path
		else
			flash[:error]= "Something went wrong. Please try again."
			render :edit
		end
	end

	def destroy
    @address.destroy
		redirect_to addresses_path
	end

private

	def find_address
		@address = Address.find(params[:id])
	end

	def address_params
		params.require(:address).permit(:latitude, :longitude, :street,
		:city, :state, :zip, :venue_id, :venue_rep_id, :visual_artist_id,
		:musician_id, :created_at, :updated_at)
	end

end

