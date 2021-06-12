class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
     @search = Item.ransack(params[:q])
      @items = @search.result
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

  def search
    # application controllerで生成した@qを利用して検索する
    @search = Item.ransack(params[:q])
    @items = @search.result

    render :index
  end
  
  private
  
  def item_params
    params.require(:item).permit(:product, :image, :price, :is_selling, :product_explain, :genre_id)
  end
end
