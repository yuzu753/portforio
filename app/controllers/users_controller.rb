class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    # 一覧表示
    @users = User.page(params[:page]).per(25)
    # 検索
    @q = User.ransack(params[:q])
    users = @q.result(distinct: true)
  end

  def search
    @q = User.search(search_params)
    @users = @q.result(distinct: true)
    if current_user.id != @user.id
       redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
       redirect_to root_path
    end
  end

  def log
    @user = User.find(params[:id])
    @recruitments = @user.recruitments
    if current_user.id != @user.id
       redirect_to root_path
    end
  end

  def update
     user = current_user
     if user.update(user_params)
      flash[:user_update] = 'successfully updated'
      redirect_to user_path(current_user.id)
     else
      flash[:miss_update] = 'error'
      redirect_to edit_user_path(current_user.id)
    end
  end

  def destroy
     @user = current_user
     @user.destroy
     redirect_to root_path
  end

    private
   def user_params
     params.require(:user).permit(:name,:self_introduction,:profile_image)
   end

  def search_params
    params.require(:q).permit!
  end

end
