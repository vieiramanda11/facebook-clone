require 'rails_helper'

require_relative "../support/devise"

RSpec.describe UsersController, type: :controller do 
    let(:user1) { FactoryBot.create(:user) }  
    describe 'GET #show' do
        it 'returns success status' do
            get :show, params: { id: user1.id }
            expect(response).to have_http_status(:success)
        end
    end
  end
    