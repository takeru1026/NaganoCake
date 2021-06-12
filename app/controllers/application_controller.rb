class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
    
  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admin_path
      when EndUser
        end_user_path
    end
  end
  
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :end_user
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end
  
  private
    def set_search
      @search = Item.ransack(params[:q])
      @items = @search.result
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana,:last_name_kana,:phone_number,:address,:postcode,])
  end
end
