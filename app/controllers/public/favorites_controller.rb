class Public::FavoritesController < ApplicationController


  def create
    @bulletin_board = BulletinBoard.find(params[:bulletin_board_id])
    @favorite = current_customer.favorites.new(bulletin_board_id: bulletin_board.id)
    @favorite.save
    redirect_to bulletin_board_path(bulletin_board)
  end

  def destroy
    @bulletin_board = BulletinBoard.find(params[:bulletin_board_id])
    @favorite = current_customer.favorites.find_by(bulletin_board_id: bulletin_board.id)
    @favorite.destroy
    redirect_to bulletin_board_path(bulletin_board)
  end


end
