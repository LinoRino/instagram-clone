class FollowersController < ApplicationController
  def create
    @follower = Follower.new(followed_id: params[:user_id], follower_id: current_user.id)
    if @follower.save
      flash[:success] = 'Follower successfully created'
    else
      flash[:error] = 'Something went wrong'
    end
    redirect_to user_path(params[:user_id])
  end

  def destroy
    @follower = Follower.find(params[:id])
    if @follower.destroy
      flash[:success] = 'Follower successfully deleted'
    end
    redirect_to user_path(params[:user_id])
  end

  def follower_params
    params.require(:follower).permit(:followed_id, :follower_id)
  end
end
