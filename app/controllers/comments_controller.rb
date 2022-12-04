class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to congestion_path(@comment.congestion)
    else
      @congestion = @comment.congestion
      @comments = @congestion.comments
      render "congestions/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, congestion_id: params[:congestion_id])
  end
end