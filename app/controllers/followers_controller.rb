class FollowersController < ApplicationController
  def create
    input = follower_params.merge(follower_id: current_user.id, followed_id: params[:user_id])
    @follower = Follower.new(input)
    if @follower.save
      flash[:success] = 'Follower successfully created'
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
    redirect_back(fallback_location: show_user_path)
  end

  def dpaestroy
    @follower = Follower.find(params[:id])
    @follower.destroy
    redirect_back(fallback_location: show_user_path)
  end

  private

  def follower_params
    params.require(:followe)
  end
end
