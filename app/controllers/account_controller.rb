class AccountController < ApplicationController
  def edit
    @user = User.find(current_user.id)
  end

  def update
    if current_user.update(update_params)
      flash[:success] = 'User was successfully updated'
      render 'home'
    else
      flash[:error] = 'Something went wrong'
      render 'edit'
    end
  end

  private

  def update_params
    params.require(:post)
  end
end
