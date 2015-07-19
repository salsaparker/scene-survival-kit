require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do

 let(:playlist) {Playlist.create(playlist_url: 'url')}


	describe "GET #index" do
		it "returns http success" do
			get :index
	    expect(response).to have_http_status(:success)
	  end
	end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: playlist.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new playlist successfully" do
      post :create, playlist: {playlist_url: 'Test.url'}
      expect(response).to have_http_status(:redirect)
    end
    # it 'does not create successfully' do
    #   post :create, profile:{name: nil}
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
    it "edits playlist successfully" do
      get :edit, id: playlist.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "updates playlist successfully" do
      put :update, id: playlist.id, playlist: {playlist_url: 'random.url'}
      new_playlist = 'random.url'
      updated_playlist = playlist.reload
      expect(updated_playlist.playlist_url).to eq(new_playlist)
      expect(response).to have_http_status(:redirect)
    end
    # it 'does not update successfully' do
    #   put :update, id: profile.id, profile:{name: nil}
    #   expect(flash[:error]).to be_present
    #   expect(response).to render_template(:edit)
    # end
  end

  describe "DELETE #destroy" do
    it "deletes playlist successfully" do
      delete :destroy, id: playlist.id
      expect(response).to have_http_status(:redirect)
    end
  end
end