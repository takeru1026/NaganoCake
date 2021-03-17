class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items=Item.all
  end

  def new
    @item=Item.new
  end

  def create
    item=Item.new(item_params)
    if item.save
      redirect_to admin_item_path(item)
    else
      render 'new'
    end
  end

  def update
  end

  def edit
  end

  def show
  end
  
  private
  
  def item_params
    params.require(:item).permit(:product, :image, :price, :is_selling, :product_explain, :genre_id)
  end
end
