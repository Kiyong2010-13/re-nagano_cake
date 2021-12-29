class Public::ItemsController < ApplicationController
  def index
  end
  
  def show
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
  end
end
