class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "payment_confirmation"
      @order_details = @order.order_details
      @order_details.each do |order_detail|
        order_detail.waiting_production!
      end
    elsif @order.order_status == "sent"
      @order_details = @order.order_details
      @order_details.each do |order_detail|
        order_detail.production_completed!
      end
    end
    redirect_to  admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:postal_code,:shipping_address,:delivery_name,:shipping_fee,:amount_billed,:payment_method,:order_status)
  end
end
