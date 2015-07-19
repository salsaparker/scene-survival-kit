require 'rails_helper'

RSpec.describe Address, type: :model do

  context "class methods" do

    describe "relationships" do
      it "belongs to" do
        belong_to(:venue)
        belong_to(:venue_rep)
        belong_to(:visual_artist)
        belong_to(:musician)
      end
    end
  end

end