class Profile < ActiveRecord::Base
	belongs_to :user
	has_one :visual_artist
	has_one :venue_rep
	has_one :musician
end
