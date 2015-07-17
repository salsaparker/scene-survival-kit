require 'rails_helper'

RSpec.describe VenueRepsController, type: :controller do

let(:visual_artist) {VisualArtist.create(name: 'Crunch Buttsteak')}

  describe "GET #index" do
    it "returns http success" do 
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: visual_artist.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new visual artist successfully" do
      post :create, visual_artist: {name: 'Big McLargehuge'}
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
    it "edits visual artist successfully" do
      get :edit, id: visual_artist.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "updates visual artist successfully" do
      put :update, id: visual_artist.id, visual_artist: {name: 'Slab Hardcheese'}
      new_venue_rep = 'Slab Hardcheese'
      updated_visual_artist = visual_artist.reload
      expect(updated_visual_artist.name).to eq(new_visual_artist)
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
      delete :destroy, id: visual_artist.id
      expect(response).to have_http_status(:redirect)
    end
  end
end
