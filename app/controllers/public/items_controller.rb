class Public::ItemsController < ApplicationController
  before_action :authenticate_end_user!, except: [:index]
  def index
    @items=Item.all
  end

  def show
  end
end
