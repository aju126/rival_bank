class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user_account!

  def authenticate_admin_user_account! #use predefined method name
    redirect_to '/' and return if user_signed_in? #&& !current_user.is_admin?
    authenticate_user_account!
  end
  helper_method :authenticate_admin_user_account!

  # def current_admin_user #use predefined method name
  #   return nil if user_signed_in? #&& !current_user.is_admin?
  #   current_user_account
  # end

  # def account_user
  #   UserAccount.find_or_initialize_by(user_name: 'unknown')
  # end
  # helper_method :account_user

  # def authenticate_admin
  #   redirect_to new_user_account_session_path #unless current_user.is_admin?
  # end

  protected

  def configure_permitted_parameters
    added_attrs = [:user_account, :user_name, :account_number, :password, :password_confirmation, :remember_me, :user_information, :id, :account_interest_id, :role_ids]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
