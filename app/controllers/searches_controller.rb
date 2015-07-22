class SearchesController < ApplicationController
	layout 'logged_in'
	before_action :authenticate_user!
	
	def new
		@search = Search.new
	end

	def create
		@search = Search.create(search_params)
		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
	end

	private
	def search_params
		params.require(:search).permit(:keywords, :zip, :state, :category, :name, :instrument, :genre)
		
	end
end
