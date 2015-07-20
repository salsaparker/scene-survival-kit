class Search < ActiveRecord::Base
	def search_profile
		profiles = Profile.all
		profile = profiles.where(["name LIKE ?", "%#{keywords}%"]) if keywords.present?

	end
end


def search_address
	musician = Musician.joins(:addresses).where(addresses: {"zip LIKE ?", "%#{zip}%"}) if zip.present?

end