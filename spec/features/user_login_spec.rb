require 'rails_helper'

RSpec.feature "UserLogins", type: :feature do
  let(:user1) { FactoryBot.create(:user) } 
  before do
    user1.confirm
  end
  
  scenario ' login invalid' do
    visit new_user_session_path
    fill_in 'Email', with: ' ', :match => :prefer_exact
    fill_in 'Password', with: user1.password, :match => :prefer_exact
      
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password.')
  end

  scenario ' login successfully' do
    visit new_user_session_path
    fill_in :placeholder => "Mail", with: user1.email, :match => :prefer_exact
    fill_in :placeholder => "Passwordd", with:  user1.password, :match => :prefer_exact

    click_button 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end

end
