class SolutionsController < ApplicationController
  before_action :set_solution, only: [:create, :destroy]

  def create
    solution = current_user.solutions.new(congestion_id: @congestion.id)
    solution.save
    redirect_to congestion_path(@congestion)
  end

  def destroy
    solution = current_user.solutions.find_by(congestion_id: @congestion.id)
    solution.destroy
    redirect_to congestion_path(@congestion)
  end

private
  def set_solution
    @congestion = Congestion.find(params[:congestion_id])
  end
end