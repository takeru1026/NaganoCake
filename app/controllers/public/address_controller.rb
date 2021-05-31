class Public::AddressController < ApplicationController
  def index
  end
  
  def create
    @address = Address.new(address_params)
	@address.end_user_id = current_end_user.id
	if @address.save
		redirect_to user_addresses_path(current_user.id)
	else
		@addresses = @user.addresses
		render 'index'
	end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
	def address_params
		params.require(:address).permit(:postcode, :address, :addresser)
	end
end
