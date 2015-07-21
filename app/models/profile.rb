class Profile < ActiveRecord::Base
	belongs_to :user
	has_one :visual_artist, dependent: :destroy
	has_one :venue_rep, dependent: :destroy
	has_one :musician, dependent: :destroy
  has_many :playlists, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :replies, dependent: :destroy

 	has_attached_file :image, styles: { large: "600x600!", 
																				 medium: "300x300!", 
																				 thumb: "150x150!" }, 
                                 # crops square at exactly ^ 150px
																				 :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  def self.search(search)
  	if search
  		where(["name LIKE ?", "%#{search.downcase}%"])
  	else
  		all
  	end
  end
end
# has_attached_file :goal_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
#   validates_attachment_content_type :goal_img, :content_type => /\Aimage\/.*\Z/

# has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
# 	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/