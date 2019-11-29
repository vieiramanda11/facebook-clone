class FriendshipsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_friend_request

    def index
        @friends = @user.friends
    end

    def create
        friend = User.find(params[:user_id])
        request_friend = current_user.request(friend)
        flash[:notice] = "Request for friend has been sent." if request_friend
        redirect_back(fallback_location: root_path)
    end

    def update
        requested_user = current_user.requested?(user)
        current_user.accept(requested_user)
        redirect_back(fallback_location: root_path)
    end

    def destroy
        user = User.find(params[:user_id])
        @connection = Friendship.where('user_id = ? and friend_id = ?', current_user.id, user.id).first
        @connection.destroy
        redirect_back(fallback_location: root_path)
    end


    def show
    end
    private

    def set_friend_request
        @friend_request = User.find(params[:user_id])
    end
end
