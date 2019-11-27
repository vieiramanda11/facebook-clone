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

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

  has_many :friends, -> { Friendship.where(confirmed: "true")},  through: :friendships, :foreign_key => "user_id",  source: :friend
  has_many :requests, -> {Friendship.where(confirmed: "false")}, through: :friendships, :foreign_key => "user_id", source: :friend

  mount_uploader :profile_pic, AvatarUploader

  
  def friends
    friends_array = friendships.map{|friendship| friendship.friend if friendship.confirmed}
    friends_array + inverse_friendships.map{|friendship| friendship.user if friendship.confirmed}
    friends_array.compact
  end

  def pending_friends  # for current user
    friendships.map{|friendship| friendship.friend if !friendship.confirmed}.compact
  end


  def friend_requests  # for friend
    inverse_friendships.map{|friendship| friendship.user if !friendship.confirmed}.compact
  end

  def confirm_friend(user)
    friendship = inverse_friendships.find{|friendship| friendship.user == user}
    friendship.confirmed = true
    friendship.save
  end

  def friend?(user)
    friends.include?(user)
  end

  def requested?(user)
    requests.include?(user)
  end


  def request(friend)
    friendship = Friendship.create(user_id: self, friend_id: friend)
  end
  def accept(friend)
    friendship = Friendship.create(user_id: current_user.id, friend_id: friend, confirmed: "true")
    current_user.friendships.build.friendship
  end


end
