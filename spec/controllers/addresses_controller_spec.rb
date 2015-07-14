require 'rails_helper'

RSpec.describe AddressesController, type: :controller do

	let(:address) {Address.create(street: '123 South Street', city: 'Test City', state: 'Test State', zip: 12345)}

	describe "GET #index" do
		it "returns http success" do
			get :index
	    expect(response).to have_http_status(:success)
	  end
	end
end