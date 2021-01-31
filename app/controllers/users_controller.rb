class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @nickname = current_user.name
    @camps = current_user.camps
  end
end
