class LikesController < ApplicationController
    def new
        @likes = Like.new
    end

    def create
        @post = Post.find(params[:id])
        current_user.like(@post)
        redirect_to root_path
    end

    def cancel
    end
end
