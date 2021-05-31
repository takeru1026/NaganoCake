class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @order = Order.all
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    order = Order.find(params[:id])
    #注文ステータスが"入金確認"になったら製作ステータスを"製作待ち"
    if order.update(order_params)
      flash[:notice] = "注文ステータスが更新されました。"
      if order.status == "入金確認"
        flash[:success] = "製作ステータスが更新されました。"
        order.order_details.update(product_status: "製作待ち")
      end
    end
    redirect_to admin_order_path(order)
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
end
