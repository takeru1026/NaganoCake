class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order_detail.order_id)
    if @order_detail.update(order_detail_params)
      flash[:notice] = "製作ステータスが更新されました。"
      if @order_detail.order.status != "製作中" && @order_detail.product_status == "製作中"
        @order_detail.order.update(status: "製作中")
        flash[:success] = "注文ステータスが更新されました。"
      end
      complete_items = @order_details.where(product_status: "製作完了")
      if @order_details.count == complete_items.count
        @order_detail.order.update(status: "発送準備中")
        flash[:success] = "注文ステータスが更新されました。"
      end
    end
    redirect_to admin_order_path(@order_detail.order)
  end

  private
  
  def order_detail_params
    params.require(:order_detail).permit(:product_status)
  end
end
