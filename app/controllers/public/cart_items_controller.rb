class Public::CartItemsController < ApplicationController
  def index
    @cart_item=current_end_user.cart_items
  end

  def create
   
    if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      redirect_to cart_items_path
      flash[:success] = "商品はカートに追加済みです。"
    else
      @cart_item=CartItem.new(cart_item_params)
      @cart_item.end_user_id=current_end_user.id
      @cart_item.item_id=params[:item_id]
      if @cart_item.save 
        redirect_to cart_items_path
      end
    end
  end

  def update
    cart_item=CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items=current_end_user.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  private
  def cart_item_params
    params.require(:cart_item).permit(:amount, :end_user_id, :item_id)
  end
end
