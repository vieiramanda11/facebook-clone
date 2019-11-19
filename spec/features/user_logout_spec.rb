# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'UserLogouts', type: :feature do
  let(:user1) { FactoryBot.create(:user) }
  before do
    user1.confirm
  end
  before :each do
    visit new_user_session_path
    fill_in 'Email', with: user1.email, match: :prefer_exact
    fill_in 'Password', with: user1.password, match: :prefer_exact
    click_button 'Log in'
  end

  scenario ' logout successfully' do
    visit root_path
    page.find(:xpath, "//a[@href='/users/sign_out']").click
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
