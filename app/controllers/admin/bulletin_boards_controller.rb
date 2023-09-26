class Admin::BulletinBoardsController < ApplicationController
  before_action :authenticate_admin!

  def index
     @bulletin_boards = BulletinBoard.all
  end


  def destroy
    # byebug
    @bulletin_board = BulletinBoard.find(params[:id])
    @bulletin_board.destroy
    redirect_to admin_bulletin_boards_path
  end

  private

  def bulletin_board_params
    params.require(:bulletin_board).permit(:customer_id, :title, :message,)
  end

end
