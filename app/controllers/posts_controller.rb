class PostsController < ApplicationController
  before_action :user_signed_in?, only: [:create,:destroy]
  before_action :correct_user, only: [:edit, :destroy]
  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find_by(params[:id])
    if @post.update(post_params)
      flash[:success] = "Post is edited"
      redirect_to root_path
    else
      render 'edit'
    end
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
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to root_path
  end

  private
  
    def post_params
      params.require(:post).permit(:content)
    end


    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_path if @post.nil?
    end
end
