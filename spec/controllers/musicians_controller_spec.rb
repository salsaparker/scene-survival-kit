require 'rails_helper'

RSpec.describe MusiciansController, type: :controller do

let(:musician) {Musician.create(instrument: 'Harmonica')}

	describe "GET #index" do
		it "returns http success" do
			get :index
	    expect(response).to have_http_status(:success)
	  end
	end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: musician.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new musician successfully" do
      post :create, musician: {instrument: 'banjo'}
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
    it "edits musician successfully" do
      get :edit, id: musician.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "updates musician successfully" do
      put :update, id: musician.id, musician: {instrument: 'harpsichord'}
      new_musician = 'harpsichord'
      updated_musician = musician.reload
      expect(updated_musician.instrument).to eq(new_musician)
      expect(response).to have_http_status(:redirect)
    end
    # it 'fails to update address' do
    #   put :update, id: address.id, address: {street: nil}
    #   expect(flash[:error]).to be_present
    #   expect(response).to render_template(:edit)
    # end  
  end

  describe "DELETE #destroy" do
    it "deletes musician successfully" do
      delete :destroy, id: musician.id
      expect(response).to have_http_status(:redirect)
    end
  end
end
