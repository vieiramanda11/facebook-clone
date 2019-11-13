require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  describe "GET #content:string" do
    it "returns http success" do
      get :content:string
      expect(response).to have_http_status(:success)
    end
  end

end
