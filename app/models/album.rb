class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :profile
  belongs_to :visual_artist
  belongs_to :musician 
  belongs_to :venue_rep
end
