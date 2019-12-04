# frozen_string_literal: true

class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_friend_request, except: [:friend_requests]

  def index
    @friends = current_user.friends
  end

  def create
    friend = User.find(params[:user_id])
    request_friend = current_user.request(friend)
    flash[:notice] = 'Request for friend has been sent.' if request_friend
    redirect_back(fallback_location: root_path)
  end

  def update
    user = User.find(params[:user_id])
    @connection = Friendship.where('user_id = ? and friend_id = ?', user.id, current_user.id).first
    @connection.update_column(:confirmed, true)
    flash[:success] = 'You are friends'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = User.find(params[:user_id])
    @connection = Friendship.where('user_id = ? and friend_id = ?', current_user.id, user.id).first
    @connection2 = Friendship.where('user_id = ? and friend_id = ?', user.id, current_user.id).first
    if @connection
      @connection.destroy
    else
      @connection2.destroy
    end
    redirect_back(fallback_location: root_path)
  end


  def friend_requests
    @requests = current_user.friend_requests
  end

  private

  def set_friend_request
    @friend_request = User.find(params[:user_id])
  end
end
