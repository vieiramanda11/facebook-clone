# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @user1 = build(:user)
  end

  subject { @user1.posts.build(content: 'Post text here') }
  before { subject.save }

  it 'should be valid' do
    expect(subject).to be_valid
  end

  it 'content should be present' do
    post = Post.new(content: nil)
    expect(post).to_not be_valid
  end

  it 'post should not be too short' do
    subject.content = 'a'
    expect(subject).to_not be_valid
  end
end
