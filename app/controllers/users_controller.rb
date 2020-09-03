class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    user_params =  params.require(:user).permit(:first_name, :last_name, :description, :avatar)
    
    if params[:avatar]
      @user.avatar.purge
      @user.avatar.attach(params[:avatar])
    end
    
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

end
