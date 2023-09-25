class CommentsController < ApplicationController
  def create
    input = comment_params.merge(user_id: current_user.id, post_id: params[:post_id])
    @comment = Comment.new(input)
    @comment.save
    redirect_back(fallback_location: home_index_path)
  end

  def index
    @comments = Comment.where(post_id: params[:post_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
