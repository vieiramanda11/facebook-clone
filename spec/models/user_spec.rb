require 'rails_helper'
require 'factory_bot_rails'

user = create(:user)

RSpec.describe User, type: :model do
  
  it 'should be valid' do
    expect(user).to be_valid
  end

  # it 'name should be present' do
  #   user = user.name(Nil)
  #   expect(user).to_not be_valid
  # end

  it 'name should not be too short' do
    user.first_name = 'a'
    expect(user).to_not be_valid
  end

  it 'name shoult not be too long' do
    user.last_name = 'a' * 30
    expect(user).to_not be_valid
  end
end
