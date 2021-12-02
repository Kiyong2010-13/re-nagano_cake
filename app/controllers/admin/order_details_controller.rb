class Admin::OrderDetailsController < ApplicationController
  def update
  end
  
  private
  
  def order_detail_params
    params.require(:order_detail).params(:productie_status)
  end
end
