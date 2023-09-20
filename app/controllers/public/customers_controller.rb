class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_currect_customer, only: [:edit, :update,:confirm]

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customer_path
  end


  def confirm
    @customer = current_customer
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

private

  def customer_params
    params.require(:customer).permit(:nick_name, :favorite_game,:introduction,:sex, :email,:birthday,:image, :is_deleted, genre_ids:[])
  end

  def ensure_currect_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end

end
