# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'FriendRequests', type: :feature do
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

  before :each do
    visit new_user_session_path
    fill_in 'Email', with: user1.email, match: :prefer_exact
    fill_in 'Password', with: user1.password, match: :prefer_exact

    click_button 'Log in'
  end

  scenario "send friend request" do
    visit users_path
    
    page.first('.btn.btn-default').click
    page.find(:xpath, "//a[@href='/users/sign_out']").click


    visit new_user_session_path
    fill_in 'Email', with: user2.email, match: :prefer_exact
    fill_in 'Password', with: user2.password, match: :prefer_exact

    click_button 'Log in'
    expect(page).to have_content('Friend Requests 1')

  end

  scenario "accept or reject friend" do
    visit users_path
    
    page.first('.btn.btn-default').click
    page.find(:xpath, "//a[@href='/users/sign_out']").click


    visit new_user_session_path
    fill_in 'Email', with: user2.email, match: :prefer_exact
    fill_in 'Password', with: user2.password, match: :prefer_exact

    click_button 'Log in'

    click_link('Friend Request')
    click_button 'Accept'
    expect(page).to have_content('Friend Requests 0')
  end

end