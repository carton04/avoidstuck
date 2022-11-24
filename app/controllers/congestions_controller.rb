class CongestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @congestion = Congestion.all
  end

  def new
    @congestion = Congestion.new
  end

  def create
    @congestion = Congestion.new(congestion_params)
    if @congestion.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @congestion = Congestion.find(params[:id])
    @user = User.find(params[:id])
  end

  private
  def congestion_params
    params.require(:congestion).permit(:ski_resort_id, :situation, :waiting, :image).merge(user_id: current_user.id)
  end
end
