class VisitorsController < ApplicationController
	layout 'visitor'
  def welcome
  	if user_signed_in?
  		redirect_to welcome_path
  	end
  end
end
