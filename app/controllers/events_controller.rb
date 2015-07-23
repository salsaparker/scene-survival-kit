class EventsController < ApplicationController

	# before_action :authenticate_user!
	before_action :find_event, only: [:edit, :update, :show, :destroy]

  def index
		@events = Event.all
		@events_by_date = @events.group_by(&:event_date)
  	# @events_by_date = @all_events.group_by(&:activity_on)
		@date = params[:date] ? Date.parse(params[:date]) : Date.today
  end

  def show
  end

  def new
		@event = Event.new
  end

	def create
		@event = Event.new(event_params)
		if @event.save
			flash[:notice]= "Event created!"
			redirect_to events_path
		else
			flash[:error]= "Something went wrong. Please try again."
			render :new
		end
	end

  def edit
  end

	def update
		if @event.update(event_params)
			flash[:notice]= "Event updated!"
			redirect_to events_path
		else
			flash[:error]= "Something went wrong. Please try again."
			render :edit
		end
	end

	def destroy
    @event.destroy
		redirect_to events_path
	end

	private

	def find_event
    @event = Event.find_by_id(params[:id])
	end

	def event_params
		params.require(:event).permit(:image, :event_name, :event_desc, :event_date, :start_time,
		:user_id, :venue_id, :created_at, :updated_at)
	end

end
