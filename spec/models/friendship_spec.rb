require 'rails_helper'

RSpec.describe Friendship, type: :model do

  let(:user1) { FactoryBot.create(:user) }
  before do
    user1.confirm
  end

  let(:user2) { User.create(first_name: 'name', last_name: 'surename',
    email: 'anyemail@gmail.com', password: 'password',
    password_confirmation: 'password') }

    before do
      user2.confirm
    end

  it 'should not be able to send a friend request to yourself' do
    friendship = Friendship.new(user_id: user1.id, friend_id: user1.id)
    expect(friendship).to_not be_valid
  end

  it 'should not be able to send a friend request to yourself' do
    friendship = Friendship.new(user_id: user1.id, friend_id: user2.id)
    expect(friendship).to be_valid
  end

end
