class CampsController < ApplicationController
  def index
    @camps = Camp.includes(:user)
  end

  def new
    @camp = Camp.new
  end

  def create
    @camp = Camp.new(camp_params)
    if @camp.save
      redirect_to root_path
    else 
      render :new
    end
  end

  private

  def camp_params
    params.require(:camp).permit(:title, :text, :category, :image).merge(user_id: current_user.id)
  end

end
