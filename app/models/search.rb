class Search < ActiveRecord::Base
	def search_profile
		profiles = Profile.all
		profile = profiles.where(["name LIKE ?", "%#{keywords}%"]) if keywords.present?
		return profile
	end

	def search_musician
		musicians = Musician.all
		musician = musicians.where(["instrument LIKE ?", "%#{instrument}%"]) if instrument.present?
		musician = musicians.where(["genre LIKE ?", "%#{genre}"]) if genre.present?
		return musician
	end

	def search_address
		musician = Musician.joins(:addresses).where(addresses: {"zip LIKE ?", "%#{zip}%"}) if zip.present?
		musician = Musician.joins(:addresses).where(addresses: {"state LIKE ?", "%#{state}%"}) if zip.present?
		venue_rep = VenueRep.joins(:addresses).where(addresses: {"zip LIKE ?", "%#{zip}%"}) if zip.present?
		venue_rep = VenueRep.joins(:addresses).where(addresses: {"state LIKE ?", "%#{state}%"}) if zip.present?
		visual_artist = VisualArtist.joins(:addresses).where(addresses: {"zip LIKE ?", "%#{zip}%"}) if zip.present?
		visual_artist = VisualArtist.joins(:addresses).where(addresses: {"state LIKE ?", "%#{state}%"}) if zip.present?
	end
end