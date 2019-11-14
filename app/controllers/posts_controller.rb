class PostsController < ApplicationController

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
    end
  end

  private

    def post_params
      params.permit(:post).require(:content)
    end

end
