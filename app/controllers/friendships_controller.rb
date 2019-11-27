class FriendshipsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_friend_request

    def index
        @friends = Friendship.all
    end

    def create
        friend = User.find(params[:user_id])
        @request_friend = current_user.request(friend)
    end

    def update 
    end

    def destroy
    end
    private

    def set_friend_request
        @friend_request = User.find(params[:user_id])
    end
end
