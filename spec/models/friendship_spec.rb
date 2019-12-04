# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Friendship, type: :model do
  let(:user1) { FactoryBot.create(:user) }
  before do
    user1.confirm
  end

  let(:user2) do
    User.create(first_name: 'name', last_name: 'surename',
                email: 'anyemail@gmail.com', password: 'password',
                password_confirmation: 'password')
  end

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

  it 'check if user is not confirmed friend' do
    Friendship.new(user_id: user1.id, friend_id: user2.id)
    value = user1.friend?(user2)
    expect(value).to be false
  end

  it 'check if user is requested friendship' do
    Friendship.create(user_id: user1.id, friend_id: user2.id)
    value = user1.pending_friends.include?(user2)
    expect(value).to be true
  end

  it 'check if user is pending friendship' do
    Friendship.create(user_id: user1.id, friend_id: user2.id)
    value = user2.friend_requests.include?(user1)
    expect(value).to be true
  end


  it 'check if user is requested friendship' do
    Friendship.create(user_id: user1.id, friend_id: user2.id, confirmed: true)
    value = user2.friends.include?(user1)
    expect(value).to be true
  end
end
