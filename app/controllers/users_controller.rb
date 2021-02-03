class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = current_user.name
    @email = current_user.email
  end
end
