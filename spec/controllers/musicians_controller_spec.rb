require 'rails_helper'

RSpec.describe MusiciansController, type: :controller do

describe "GET #index" do
  it "responds successfully with an HTTP 200 status code" do
    get :index
    expect(response).to be_success
  end
end

# describe "POST #create" do
#   it 'creates a musician successfully'
#   Musician.create(genre: 'testing', instrument: 'test')
#   expect(:genre).to eql('testing')
# end

end
