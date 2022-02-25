class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
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
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.amount = cart_item.amount
      @order_detail.purchase_price = cart_item.item.add_tax_price*cart_item.amount
      @order_detail.order_id = @order.id
      @order_detail.save
    end

    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :shipping_address, :shipping_fee, :delivery_name, :shipping_address, :amount_billed, :customer_id, :payment_method, :order_status)
  end
end
