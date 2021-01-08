class CampsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_camp, only: [:edit, :show, :update, :destroy]


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
  end

  def edit
    if current_user.id != @camp.user_id
      redirect_to root_path
    end
  end

  def update
    if @camp.update(camp_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @camp.user_id
      @camp.destroy
      redirect_to root_path
    end
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

  def set_camp
    @camp = Camp.find(params[:id])
  end

end
