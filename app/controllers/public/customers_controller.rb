class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to current_customer_path
  end


  def confirm
    @customer = current_customer
  end

  def withdraw
    customer = current_customer
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

private

  def customer_params
    params.require(:customer).permit(:nick_name,:genre_id, :favorite_game,:introduction,:sex, :email,:birthday)
  end

end