class LikesController < ApplicationController
  def create
    input = like_params.merge(user_id: current_user.id)
    @like = Like.new(input)
    if @like.save
      flash[:success] = 'Post successfully liked'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_back(fallback_location: home_index_path)
  end

  def destroy
    @like = Like.where(user_id: current_user.id, post_id: params[:post_id]).first
    @like.destroy
    redirect_back(fallback_location: home_index_path)
  end

  private

  def like_params
    params.permit(:post_id)
  end
end
