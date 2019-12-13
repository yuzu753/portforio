class RecruitmentsController < ApplicationController
  def index
    @rucruitments = Recruitment.all
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @user = @recruitment.user
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    if
      @recruitment.save
      redirect_to complete_path
    else
      redirect_to new_recruitment_path
      binding.pry
    end
    #    redirect_to comlete_path
    #    tag_list = params[:tags_name].split(",")
    # if
    #    @recruitment.save
    #    @recruitment.save_recruitments(tag_list)
    #  else
    #    redirect_to new_recruitment_path
    # end
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def confirmation
  end

  def complete
  end

  private
  def recruitment_params
      params.require(:recruitment).permit(:user_id, :category, :title, :body, :event_date, :area, :address, :recruitments_number)
  end
end
