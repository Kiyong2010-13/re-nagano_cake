class Admin::OrdersController < ApplicationController
  def show
  end
  
  def update
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postal_code,:shipping_address,:delivery_name,:shipping_fee,:amount_billed,:payment_method,:order_status)
  end
end