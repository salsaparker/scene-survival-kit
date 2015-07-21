class VisualArtist < ActiveRecord::Base
	belongs_to :profile
  has_many :photos, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_many :addresses
  accepts_nested_attributes_for :addresses, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
