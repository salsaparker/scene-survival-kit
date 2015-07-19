class PagesController < ApplicationController
	before_action :authenticate_user!
  layout 'logged_in'
  
  def welcome
  end

  def choose_profile
  end
end
