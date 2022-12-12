class CongestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @congestions = Congestion.order("created_at DESC")
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
    @user = User.new
    @comment = Comment.new
    @comments = @congestion.comments.includes(:user)
  end

  def edit
    @congestion = Congestion.find(params[:id])
    unless @congestion.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
  @congestion = Congestion.find(params[:id])
    if @congestion.update(congestion_params)
      redirect_to congestion_path, method: :get
    else
      render :edit
    end
  end

  def destroy
    @congestion = Congestion.find(params[:id])
    @congestion.destroy
    redirect_to root_path
  end

  private
  def congestion_params
    params.require(:congestion).permit(:ski_resort_id, :situation, :waiting, :latitude, :longitude, :image).merge(user_id: current_user.id)
  end
end