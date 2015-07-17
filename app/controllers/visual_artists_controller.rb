class VisualArtistsController < ApplicationController

  def index
		@visual_artists = VisualArtist.all
  end

  def new
  end

  def show
  end

  def edit
  end
end
