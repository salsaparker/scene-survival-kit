class VenuesController < ApplicationController

# before_action :authenticate_user!
before_action :find_venue, only: [:edit, :update, :show, :destroy]

  def index
    @venues = Venue.all 
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      flash[:notice]= "Venue Created!"
      redirect_to(venue_path(@venue.id))
    else
      flash[:error]= "Venue Creation Failed!"
      render :new
    end
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      flash[:notice]= "Venue Updated!"
      redirect_to(venue_path(@venue.id))
    else
      flash[:error]= "Venue Update Failed!"
      render :edit
    end
  end

  def show
  end

  def destroy
    @venue.destroy
    redirect_to venues_path
  end

  private

  def find_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:title, :event_id, :venue_rep_id)
  end
end
