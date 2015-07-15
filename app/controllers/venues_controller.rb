class VenuesController < ApplicationController
before_action :authenticate_user!
before_action :find_venue, only: [:edit, :update, :show, :destroy]
  def index
    @venues = Venue.all 
  end #index end

  def new
    @venue = Venue.new
  end #new end

  def create
    if @venue.create(venue_params)
      flash[:notice]= "Venue Created!"
      redirect_to(user_path(@user.id))
    else
      flash[:error]= "Venue Creation Failed!"
      render :new
    end
  end #create end

  def edit
    
  end #edit end

  def update
    if @venue.update(venue_params)
      flash[:notice]= "Venue Updated!"
      redirect_to(user_path(@user.id))
    else
      flash[:error]= "Venue Update Failed!"
      render :edit
    end
  end #update end

  def show
    
  end #show

  def destroy
    @venue.destroy
  end #destroy end

  private

  def find_venue
    @venue = Venue.find_by(id: params[:id])
  end

  def venue_params
    params.require(:venue).permit(:title, :event_id, :venue_rep_id)
  end
end
