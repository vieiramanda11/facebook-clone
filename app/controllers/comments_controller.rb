class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy, :create]

  def index
  @comments = Comment.all.where("post_id = ?",
    Post.find_by_id(params[:id]))
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Comment created!"
    else
      flash[:danger] = "Comment not created!"
    end
    redirect_to root_url
  end

  def destroy
  end

  private

    def set_comment
      @comment = current_user.comments.find_by(id: params[:id])
    end

    def comment_params
      params.require(:comment).permit(:comment, :post_id)
    end
end
