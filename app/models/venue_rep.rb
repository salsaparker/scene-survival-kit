class VenueRep < ActiveRecord::Base
	belongs_to :profile
	has_many :addresses
	has_many :venues
  has_many :albums, dependent: :destroy
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :address, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

end
