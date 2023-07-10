class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    inputs = post_params.merge(user_id: current_user.id)
    @post = Post.new(inputs)
    if @post.save
      flash[:success] = 'Post successfully created'
      redirect_to @post
    else
      flash[:error] = 'Something went wrong'
      render 'new'
    end
  end

  def show
    @post = Post.find
  end

  private

  def post_params
    params.require(:post).permit(:title, :image)
  end
end
