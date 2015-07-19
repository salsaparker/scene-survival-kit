class VenueRep < ActiveRecord::Base
	belongs_to :profile
	has_many :addresses
	has_many :venues
  has_many :albums, dependent: :destroy
  has_many :photos, dependent: :destroy
end
