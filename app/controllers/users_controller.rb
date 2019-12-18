class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def log
  end

  def update
     @user = User.find(params[:id])
     if @user.update(user_params)
      flash[:notice] = 'successfully updated'
      redirect_to user_path(current_user.id)
     else
      flash[:notice] = 'error'
      redirect_to root_path
    end
  end

  def destroy
     @user = User.find(params[:id])
     @user.destroy
     redirect_to root_path
  end

    private
   def user_params
     params.require(:user).permit(:name,:self_introduction,:profile_image)
   end
end
