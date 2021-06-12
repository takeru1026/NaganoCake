class Admin::EndUsersController < ApplicationController
    before_action :authenticate_admin!
  def index
    @user = EndUser.all
  end
  
  def show
      
  end
  
  def edit
      
  end
  
  def update
  end
end
