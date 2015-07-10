class EventsController < ApplicationController

before_action :find_event, only: [:edit, :update, :show, :destroy]

  def index
		@events = Event.all
  end

  def show
  end

  def new
		@event = Event.new
  end

	def create

	end

  def edit

  end

	def update

	end

	def destroy

	end

private

	def find_event

	end

	def event_params

	end

end
