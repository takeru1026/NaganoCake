class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  
  def show
    @user = current_end_user
  end

  def edit
    @user = current_end_user
  end

  def update
    user = current_end_user
    if user.update(end_user_params)
      redirect_to end_user_path
    else
      render 'edit'
    end
  end

  def out
    @user = current_end_user
  end

  def quit
    @user = current_end_user
    @user.update(is_unsubscribed: false)
    reset_session
    redirect_to root_path
  end
  
  private
  
  def end_user_params
    params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :address, :postcode, :email)
  end
end
