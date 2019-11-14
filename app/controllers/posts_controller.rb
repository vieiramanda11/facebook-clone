class PostsController < ApplicationController
  before_action :user_signed_in?, only: [:create,:destroy]
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      flash[:danger] = "Your post was not created!"
      redirect_to root_path
    end
  end

  def destroy

  end

  private
  
    def post_params
      params.require(:post).permit(:content)
    end

end
