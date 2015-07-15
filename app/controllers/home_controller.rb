class HomeController < ApplicationController
	layout 'visitor'
  def index
  	if user_signed_in?
  		redirect_to welcome_path
  	end
  end
end
