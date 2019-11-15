require 'rails_helper'

require_relative "../support/devise"

RSpec.describe UsersController, type: :controller do
    describe 'GET #new' do
        login_user
        it 'returns success status' do
            get :index
            expect(response).to have_http_status(:ok)
        end
    end
  end

#   describe 'Post #create' do
#     it 'successfully sign in ' do
#       post :create, params: { user: { first_name: 'namee', last_name:"lastname", email:"test@test.com", password:"password" } }
#       after(:create) { |user| user.confirm! }
#       expect(User.last.name).to eq('namee')
#     end
#   end
    
