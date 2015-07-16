require 'rails_helper'

RSpec.describe VenuesController, type: :controller do

let(:venue) {Venue.create(title: 'Random Venue')}

	describe "GET #index" do
		it "returns http success" do 
			get :index
	    expect(response).to have_http_status(:success)
	  end
	end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: venue.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new venue successfully" do
      post :create,venue: {title: 'Venue Title'}
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
    it "edits venue successfully" do
      get :edit, id: venue.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "updates venue successfully" do
      put :update, id: venue.id, venue: {title: 'Test Title'}
      new_venue = 'Test Title'
      updated_venue = venue.reload
      expect(updated_venue.title).to eq(new_venue)
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
      delete :destroy, id: venue.id
      expect(response).to have_http_status(:redirect)
    end
  end
end
