# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true, length: { in: 2..20 }
  validates :last_name, presence: true, length: { in: 2..20 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friendships
  has_many :inverse_friendships, -> { where(confirmed: true) }, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :requests, -> {where(confirmed: false)}, class_name: "Friendship", :foreign_key => "friend_id", source: :friend
  has_many :pending_friendships, -> { where(confirmed: false) }, class_name: 'Friendship', :foreign_key => "user_id", dependent: :destroy
  mount_uploader :profile_pic, AvatarUploader

  

  def pending_friends  # for current user
    friendships.map{|friendship| friendship.friend if !friendship.confirmed}.compact
  end


  def friend_requests  # for friend
    requests.map{|friendship| friendship.user if !friendship.confirmed}.compact
  end

  def friend?(friend)
    friends = Friendship.where(user: self, friend: friend, confirmed: true) + Friendship.where(user: friend, friend: self, confirmed: true)
    friends.any?
  end

  def request(friend)
    Friendship.create(user_id: id, friend_id: friend.id)
  end

  def destroy_process(friend)
    current_user.friendships.find_by(friend_id: friend.id)
  end


end
