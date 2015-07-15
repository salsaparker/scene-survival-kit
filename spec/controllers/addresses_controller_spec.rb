require 'rails_helper'

RSpec.describe AddressesController, type: :controller do

let(:address) {Address.create(street: '123 South Street', city: 'Test City', state: 'Test State', zip: 12345)}

	describe "GET #index" do
		it "returns http success" do
			get :index
	    expect(response).to have_http_status(:success)
	  end
	end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: address.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new address successfully" do
      post :create, address: {street: '666 Adams Street', city: 'Spooky City', state: 'Spooky State', zip: 98765}
      expect(response).to have_http_status(:redirect)
    end
    it 'fails to create new address' do
      post :create, address:{street: nil}
      expect(flash[:error]).to be_present
      expect(response).to render_template(:new)
    end
  end

  describe "GET #new" do 
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "edits address successfully" do
      get :edit, id: address.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "updates address successfully" do
      put :update, id: address.id, address: {street: '555 Street'}
      new_address = '555 Street'
      updated_address = address.reload
      expect(updated_address.street).to eq(new_address)
      expect(response).to have_http_status(:redirect)
    end
    it 'fails to update address' do
      put :update, id: address.id, address: {street: nil}
      expect(flash[:error]).to be_present
      expect(response).to render_template(:edit)
    end  
  end

  describe "DELETE #destroy" do
    it "deletes address successfully" do
      delete :destroy, id: address.id
      expect(response).to have_http_status(:redirect)
    end
  end
end
