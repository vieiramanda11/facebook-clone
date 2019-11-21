# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  @user = User.create(first_name: 'name', last_name: 'surename',
  email: 'test@email.com', password: 'password',
  password_confirmation: 'password')
  @post = @user.posts.new(content: 'Content text')

  it 'liked' do
    @like = Like.new(user: @user, post: @post)
    expect(@like).to be_truthy
  end

  it 'not liked' do
    @like = Like.new(user: @user, post: @post)
    @like.destroy
    expect(@like).to_not be_valid
  end
end
