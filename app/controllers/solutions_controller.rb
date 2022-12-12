class SolutionsController < ApplicationController
  def create
    @congestion = Congestion.find(params[:congestion_id])
    solution = current_user.solutions.new(congestion_id: @congestion.id)
    solution.save
    redirect_to congestion_path(@congestion)
  end

  def destroy
    @congestion = Congestion.find(params[:congestion_id])
    solution = current_user.solutions.find_by(congestion_id: @congestion.id)
    solution.destroy
    redirect_to congestion_path(@congestion)
  end
end