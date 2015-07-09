class Address < ActiveRecord::Base
	belongs_to :venue
	belongs_to :venue_rep
	belongs_to :visual_artist
	belongs_to :musician
end
