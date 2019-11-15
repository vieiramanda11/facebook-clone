require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }  
  
  describe 'POST #create' do
    it 'successfully create post' do
      session[:user_id] = user.id
      post :create, params: { post: { content: 'Post content' } }
      expect(Post.last.content).to eq('Post content')
    end
  end
end
