class Event < ActiveRecord::Base

	has_attached_file :image, styles: { large: "600x600>", 
																				 medium: "300x300>", 
																				 thumb: "150x150>" }, 
                                 # crops square at exactly ^ 150px
																				 :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  hase_one :address, dependent: :destroy
end
