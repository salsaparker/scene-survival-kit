require 'rails_helper'

RSpec.describe Photo, type: :model do
  
  context "class methods" do

    describe "relationships" do
      it "belongs to" do
        should belong_to(:profile)
        belong_to(:musician)
        belong_to(:venue_rep)
        belong_to(:visual_artist)
      end
    end

  end
end
