class VisitorsController < ApplicationController
	layout 'visitor'
  def index
  	if user_signed_in?    # the tests don't like this method...?
  		redirect_to welcome_path
  	end
  end
end
