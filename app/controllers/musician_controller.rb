class MusicianController < ApplicationController
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

	def edit
	end

	def update
	end

	def destroy
	end

end
