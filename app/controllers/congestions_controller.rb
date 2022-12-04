class CongestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_action, except: [:index, :new, :create]

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
    @user = User.new
    @comment = Comment.new
    @comments = @congestion.comments.includes(:user)
    @user = User.new
  end

  def edit
    unless @congestion.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @congestion.update(congestion_params)
      redirect_to congestion_path, method: :get
    else
      render :edit
    end
  end

  def destroy
    @congestion.destroy
    redirect_to root_path
  end

  private
  def congestion_params
    params.require(:congestion).permit(:ski_resort_id, :situation, :waiting, :latitude, :longitude, :image).merge(user_id: current_user.id)
  end

  def set_action
    @congestion = Congestion.find(params[:id])
  end
end
