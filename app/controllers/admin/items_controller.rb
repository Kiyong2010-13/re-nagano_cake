class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :price, :is_active)
  end
end
