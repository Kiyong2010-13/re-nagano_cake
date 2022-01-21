class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def complete
  end

  def comfirm
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.shipping_address = current_customer.address
      @order.delivery_name = current_customer.full_name
    elsif params[:order][:address_option] == "1"
      ship = Address.find(params[:order][:address_id])
      @order.postal_code = ship.postal_code
      @order.shipping_address = ship.address
      @order.delivery_name = ship.name
    elsif params[:order][:address_option] = "2"
      @order.postal_code = params[:order][:postal_code]
      @order.shipping_address = params[:order][:address]
      @order.delivery_name = params[:order][:name]
    else
          render 'new'
    end

    @cart_items = current_customer.cart_items.all
    @order.customer_id = current_customer.id
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :shipping_address, :shipping_fee, :delivery_name, :shipping_address, :amount_billed, :customer_id, :payment_method, :order_status)
  end
end
