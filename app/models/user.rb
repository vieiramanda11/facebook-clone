# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :first_name, presence: true, length: { in: 2..20 }
  validates :last_name, presence: true, length: { in: 2..20 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
       :omniauthable, omniauth_providers: %i[facebook]
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  mount_uploader :profile_pic, AvatarUploader

  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  def friends
    friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
    result = friends_array + inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    result.compact
  end

  def friend_requests
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def friend?(friend)
    friends = Friendship.where(user: self, friend: friend, confirmed: true) +
              Friendship.where(user: friend, friend: self, confirmed: true)
    friends.any?
  end

  def request(friend)
    Friendship.create(user_id: id, friend_id: friend.id)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.profile_pic = auth.info.profile_pic
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data == session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info']
        user.email = data['email'] if user.email.blank?
      end
    end
  end
end
