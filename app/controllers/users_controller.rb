class UsersController < ApplicationController
  def edit
    @user = User.find(current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if User.update(update_params)
      flash[:success] = 'User was successfully updated'
      render 'show'
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  private

  def update_params
    params.require(:user).permit(:name, :bio, :gender, :avatar)
  end
end
