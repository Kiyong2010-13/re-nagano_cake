class Public::CartItemsController < ApplicationController
  def index
  end
  
  def create
  end
  
  def update
  end
  
  def destroy
  end
  
  def destroy_all
  end
  
  private
  
  def cart_itam_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end