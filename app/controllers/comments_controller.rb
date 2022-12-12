class CommentsController < ApplicationController
  def create
    @congestion = Congestion.find(params[:congestion_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to congestion_path(@comment.congestion)
    else
      render "congestions/show"
    end
  end

  def destroy
    @congestion = Congestion.find(params[:congestion_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to congestion_path
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, congestion_id: params[:congestion_id])
  end
end