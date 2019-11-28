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
        if params[:id]
            user = User.find_by_id(params[:id])
        else
            @friend__val = current_user.pending_friendships.find(params[:friendship_id])
        end
        @friend__val ||= current_user.friend_requests.find{|friendship| friendship.friend == user}
        redirect_back(fallback_location: root_path) if @friend__val.delete
     
    end

    def show
    end
    private

    def set_friend_request
        @friend_request = User.find(params[:user_id])
    end
end
