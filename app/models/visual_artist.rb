class VisualArtist < ActiveRecord::Base
	belongs_to :profile
  has_many :photos, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :playlists, dependent: :destroy
end
