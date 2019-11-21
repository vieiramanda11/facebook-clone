require 'rails_helper'

RSpec.describe Comment, type: :model do

  before :each do
    @user = User.create(first_name: "name", last_name: "surename", email: "test@email.com", password: "password", password_confirmation: "password")
    @post = @user.posts.new(content: "Content text")
    @comment = Comment.new(comment: "Comment text", user: @user, post: @post)
  end 
  
  it 'should be valid' do
    expect(@comment).to be_valid
  end

  it 'comment should be present' do
    @comment = Comment.new(comment: nil)
    expect(@comment).to_not be_valid
  end

  it 'comment should not be too short' do
    @comment.comment = 'a'
    expect(@comment).to_not be_valid
  end

end
