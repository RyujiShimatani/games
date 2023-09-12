class Public::CommentsController < ApplicationController
  def create
    bulletin_board = BulletinBoard.find(params[:bulletin_board_id])
    comment = current_customer.comments.new(comment_params)
    comment.bulletin_board_id = bulletin_board.id
    comment.save
    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
