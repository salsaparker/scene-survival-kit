class VenueRep < ActiveRecord::Base
	belongs_to :profile
	has_many :addresses
	has_many :venues
end
