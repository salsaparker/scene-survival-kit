require 'rails_helper'

RSpec.describe Album, type: :model do
  

  context "Class methods" do
    
    describe "relationships" do
      
      it "belongs to" do
        should belong_to(:profile)
        should belong_to(:visual_artist)
        should belong_to(:musician)
        should belong_to(:venue_rep)
      end

      it "has many" do
        should have_many(:photos)
      end
      
    end
  end
end
