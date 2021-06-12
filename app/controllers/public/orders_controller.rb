class Public::OrdersController < ApplicationController
  def index
  end
  
  def new
    @order = Order.new
    @address = Address.new
    @ship_address = current_end_user.addresses
  end

  def confirm
    @order = current_end_user.orders.new
    @cart_items = CartItem.where(end_user_id:[current_end_user.id])
    @order.terms_payment = params[:order][:terms_payment] 
    @order.postage = 800
    @order.status = "入金待ち"
    
    if params[:order][:address_option] == "0"
      @order.postcode = current_end_user.postcode
      @order.address = current_end_user.address
      @order.addresser = "#{current_end_user.last_name}#{current_end_user.first_name}"
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:registered_address])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.addresser = @address.addresser
      
    elsif params[:order][:address_option] == "2"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.addresser = params[:order][:addresser]
      @address = current_end_user.addresses.new(address_params)
      @address.postcode= params[:order][:postcode]
      @address.address= params[:order][:address]
      @address.addresser= params[:order][:addresser]
      @address.save!
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    current_end_user.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item_id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.price
      order_detail.product_status = "着手不可"
      order_detail.save!
          
    end
    current_end_user.cart_items.destroy_all
    redirect_to orders_done_path
  end

  def show
  end

  def done
  end
  
  private
  
  def order_params
    params.require(:order)
          .permit(:end_user_id, :terms_payment, :amount_claimed, :postage, :status, :postcode, :address, :addresser)
  end
  def address_params
    params.permit(:postcode, :address, :addresser)
  end
end
