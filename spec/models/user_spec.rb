# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = build(:user)
  end

  it 'is valid with valid attributes' do
    expect(@user1).to be_valid
  end

  it 'has a unique email' do
    user2 = build(:user, email: 'userr@user.com')
    expect(user2).to be_valid
  end

  it 'not valid email' do
    user2 = build(:user, email: 'johndoe')
    expect(user2).to_not be_valid
  end

  it 'name should be present' do
    user = build(:user, first_name: nil)
    expect(user).to_not be_valid
  end

  it 'name should not be too short' do
    user = build(:user, first_name: 'a')
    expect(user).to_not be_valid
  end

  it 'name shoult not be too long' do
    user = build(:user, first_name: 'a' * 30)
    expect(user).to_not be_valid
  end
end
