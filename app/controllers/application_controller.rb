class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_beginning_of_week
  def authenticate
    redirect_to new_user_session_url unless user_signed_in?
  end


  protected

  def after_sign_in_path_for(resource_or_scope)
    if current_user.role == true
      admin_root_path
    else
      homes_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_url
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :role])
  end

  private
  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end
end
