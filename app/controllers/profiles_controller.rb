class ProfilesController < ApplicationController
  def show
    @camp = Camp.find(params[:id])
    @camps = Camp.includes(:user)
  end
end
