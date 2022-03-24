class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    @order = @order_detail.order
    if @order_detail.productie_status == "making"

      @order.making!

    end
    count = 0
    @order_details = @order.order_details
    @order_details.each do |order_detail|
      if order_detail.productie_status = "production_completed"
        count += 1
        if count == @order_details.count
          @order.preparing_ship!
        end
      end
    end

    redirect_to  admin_order_path(@order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:productie_status)
  end
end
