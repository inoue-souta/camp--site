class CampsController < ApplicationController
  before_action :move_to_index, except: :index


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

  def show
    @camp = Camp.find(params[:id])
  end

  private

  def camp_params
    params.require(:camp).permit(:title, :text, :category, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
