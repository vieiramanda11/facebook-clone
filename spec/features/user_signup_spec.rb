# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'UserSignups', type: :feature do
  let(:user1) { FactoryBot.create(:user) }

  scenario 'signup successfully' do
    visit new_user_registration_path
    expect do
      fill_in 'First name', with: user1.first_name
      fill_in 'Last name', with: user1.last_name
      fill_in 'Email', with: 'user@gmail.com', match: :prefer_exact
      fill_in 'Password', with: user1.password, match: :prefer_exact
      fill_in 'Password confirmation', with: user1.password, match: :prefer_exact

      click_button 'Sign up'
    end.to change { User.count }
  end
end
