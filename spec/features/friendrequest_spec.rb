# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Friendrequests', type: :feature do
  let(:user1) { FactoryBot.create(:user) }

  let(:user2) { FactoryBot.create(:random_user) }

  before :each do
    Friendship.create(user_id: user1.id, friend_id: user2.id)
  end

  scenario 'send friend request' do
    visit new_user_session_path
    fill_in 'Email', with: user2.email, match: :prefer_exact
    fill_in 'Password', with: user2.password, match: :prefer_exact
    click_button 'Log in'
    expect(page).to have_content('Friend Requests 1')
  end
end
