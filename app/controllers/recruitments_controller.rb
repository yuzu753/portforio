class RecruitmentsController < ApplicationController
  before_action :authenticate_user!
  def index
    # 全件表示
    @recruitments = Recruitment.page(params[:page]).per(25)
    @recrruitment = Recruitment.new
    # 検索
    @q = Recruitment.ransack(params[:q])
    rectuitments = @q.result(distinct: true)
  end

  def search
    @q = Recruitment.search(search_params)
    @recruitments = @q.result(distinct: true)
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @user = @recruitment.user
  end

  def new
    @recruitment = Recruitment.new
    @user = current_user
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.user_id = current_user.id
    if
      @recruitment.save
      redirect_to recruitments_path
    else
      redirect_to root_path
    end
  end

  def edit
    @recruitment = Recruitment.find(params[:id])
    @user = current_user
    if @recruitment.user_id != @user.id
       redirect_to recruitments_path
    end
  end

  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy
    redirect_to recruitments_path
  end

  def update
    @recruitment = Recruitment.find(params[:id])
    if @recruitment.update(recruitment_params)
       redirect_to recruitment_path(@recruitment.id)
       flash[:update] = "投稿を更新しました"
    else
      flash[:miss_update] = 'error'
      redirect_to edit_recruitment_path(@recruitment.id)
    end
  end

  private
  def recruitment_params
      params.require(:recruitment).permit(:user_id, :category, :title, :body, :event_date, :area, :address, :recruitments_number)
  end

  def search_params
    params.require(:q).permit!
  end

end
