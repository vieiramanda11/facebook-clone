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

  scenario 'request friendship' do
    visit users_path
    page.first('.btn.btn-default').click
    expect(page).to have_content('Cancel Request')
  end
end