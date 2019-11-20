class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @comments = Comment.all
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


    def comment_params
      params.require(:comment).permit(:comment, :post_id)
    end

    # def correct_user
    #   @comment = post.comments.find_by(id: params[:id])
    #   redirect_to root_path if @comment.nil?
    # end
end
