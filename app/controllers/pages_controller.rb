class PagesController < ApplicationController
  before_action :authenticate_user!
  layout 'logged_in', only: [:welcome]
  
  def welcome
  end

  def choose_profile
  end
end

