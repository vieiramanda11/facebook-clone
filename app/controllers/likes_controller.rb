# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like, only: [:destroy]

  def create
    if liked?
      destroy
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to root_path
  end

  def destroy
    @like.destroy
    redirect_to root_path
  end

  private

  def find_like
    @like = @post.likes.find(params[:id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end
end
