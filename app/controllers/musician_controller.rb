class MusicianController < ApplicationController
	before_action :find_musician, only: [:update, :edit, :destroy, :show]
	before_action :authenticate_user!
	
	def index
		@musicians = Musician.all
	end

	def new
		@musician = Musician.new
	end

	def create
		@musician = Musician.create(musician_params)
		if @musician.save
			flash[:notice]="Musician profile made."
			redirect_to("")
		else
			flash[:error]="Failed to creaet musician profile."
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
    if @musician.update(musician_params)
      flash[:notice]= "Successfully updated!"
      redirect_to("")
    else
      flash[:error]= "Update Failed."
      render :edit
    end
	end

	def destroy

		if @musician.destroy
      flash[:alert]="Profile deleted."
    end
	    redirect_to("")
	end

	private

	def musician_params
		params.require(:musician).permit(:instrument, :genre)
	end

	def find_musician
		@musician = Musician.find_by(id: params[:id])
		unless @musician
			render(text: "Profile not found.")
		end
	end
end
