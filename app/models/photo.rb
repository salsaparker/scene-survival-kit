class Photo < ActiveRecord::Base
  has_attached_file :image, :styles => { :large => "600x600>" :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  belongs_to :profile
  belongs_to :musician
  belongs_to :venue_rep
  belongs_to :visual_artist
end
