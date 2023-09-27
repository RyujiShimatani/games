class Public::BulletinBoardsController < ApplicationController
  before_action :authenticate_customer!

  def new
    @bulletin_board = BulletinBoard.new
  end

  def index
     @bulletin_boards = BulletinBoard.all
  end

  def create
    @bulletin_board = BulletinBoard.new(bulletin_board_params)
    @bulletin_board.customer_id = current_customer.id
    @bulletin_board.save
    flash[:notice] = "投稿が成功しました。"
    redirect_to bulletin_boards_path
  end

  def show
    @bulletin_board = BulletinBoard.find(params[:id])
    @comment = Comment.new
  end

  # def edit
  #   @bulletin_board = BulletinBoard.find(params[:id])
  # end

  # def update
  #   @bulletin_board = BulletinBoard.find(params[:id])
  #   if @bulletin_board.update(item_params)
  #     flash[:success] = "更新に成功しました"
  #     redirect_to
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @bulletin_board = BulletinBoard.find(params[:id])
    @bulletin_board.destroy
    flash[:notice] = "投稿を削除しました。"
    redirect_to bulletin_boards_path
  end

  private

  def bulletin_board_params
    params.require(:bulletin_board).permit(:customer_id, :title, :message,)
  end

end
