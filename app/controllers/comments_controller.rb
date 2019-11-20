class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comment.build(comment_params)
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

    def comment_params
      params.require(:comment).permit(:comment, :post_id)
    end
end
