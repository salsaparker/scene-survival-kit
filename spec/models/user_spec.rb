require 'rails_helper'

RSpec.describe Profile, type: :model do

  context "class methods" do
    describe "relationships" do
      it "has one" do
        should have_one(:profile)
      end

      it "has_many" do
        should have_many(:events)
        should have_many(:playlists)
      end
    end
  end

end