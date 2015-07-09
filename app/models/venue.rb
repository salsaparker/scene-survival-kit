class Venue < ActiveRecord::Base
	has_many :addresses
	belongs_to :event
	belongs_to :venue_rep
end
