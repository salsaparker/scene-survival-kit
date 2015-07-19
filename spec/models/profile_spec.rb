require 'rails_helper'

RSpec.describe Profile, type: :model do
  
  context "class methods" do

    describe "relationships" do
      it "belongs to" do
        should belong_to(:user)
      end

      it "has many" do
        should have_many(:playlists)
        should have_many (:albums)
        should have_many (:photos)
      end

      it "has one" do
        should have_one (:visual_artist)
        should have_one (:venue_rep)
        should have_one (:musician)
      end
    end

  end
end