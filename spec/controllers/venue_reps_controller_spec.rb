require 'rails_helper'

RSpec.describe VenueRepsController, type: :controller do

let(:venue_rep) {VenueRep.create(profile_id: 1)}

  describe "GET #index" do
    it "returns http success" do 
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: venue_rep.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new venue rep successfully" do
      post :create, venue_rep: {profile_id: 99}
      expect(response).to have_http_status(:redirect)
    end
    # it 'fails to create new address' do
    #   post :create, address:{street: nil}
    #   expect(flash[:error]).to be_present
    #   expect(response).to render_template(:new)
    # end
  end

  describe "GET #new" do 
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "edits venue rep successfully" do
      get :edit, id: venue_rep.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "updates venue rep successfully" do
      put :update, id: venue_rep.id, venue_rep: {profile_id: 99}
      new_venue_rep = 99
      updated_venue_rep = venue_rep.reload
      expect(updated_venue_rep.profile_id).to eq(new_venue_rep)
      expect(response).to have_http_status(:redirect)
    end
    # it 'fails to update address' do
    #   put :update, id: address.id, address: {street: nil}
    #   expect(flash[:error]).to be_present
    #   expect(response).to render_template(:edit)
    # end  
  end

  describe "DELETE #destroy" do
    it "deletes venue successfully" do
      delete :destroy, id: venue_rep.id
      expect(response).to have_http_status(:redirect)
    end
  end
end
