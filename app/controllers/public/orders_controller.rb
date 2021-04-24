class Public::OrdersController < ApplicationController
  def index
  end
  
  def new
    @order = Order.new
    @ship_address = current_end_user.addresses
  end

  def confirm
  end

  def create
  end

  def show
  end

  def done
  end
end
