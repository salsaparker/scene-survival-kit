require 'rails_helper'

RSpec.describe VisitorsController, type: :controller do

  describe "GET #welcome" do
    it "redirects to welcome page on signin" do
      get :welcome
      expect(response).to have_http_status(:redirect)
    end
  end

end
