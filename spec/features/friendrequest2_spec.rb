# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Friendrequest2s', type: :feature do
  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:random_user) }

  before :each do
    visit new_user_session_path
    fill_in 'Email', with: user1.email, match: :prefer_exact
    fill_in 'Password', with: user1.password, match: :prefer_exact
    click_button 'Log in'
  end

  scenario 'accept or reject friend' do
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
