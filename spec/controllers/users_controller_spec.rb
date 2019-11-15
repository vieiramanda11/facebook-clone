require 'rails_helper'

require_relative "../support/devise"

RSpec.describe UsersController, type: :controller do 

    let(:user) { FactoryBot.create(:user) }   

    describe 'GET #show' do
        it 'returns success status' do
            get :show, params: { id: user.id }
            expect(response).to have_http_status(:success)
        end
    end
  end
    