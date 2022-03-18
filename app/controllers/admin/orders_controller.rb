class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:shipping_address,:delivery_name,:shipping_fee,:amount_billed,:payment_method,:order_status)
  end
end
