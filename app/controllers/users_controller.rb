class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @congestions = @user.congestions.order("created_at DESC")
  end

  def create
  end
end
