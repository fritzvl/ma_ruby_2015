class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end

  #def after_sign_in_path_for(resource)
  #  current_user_path
  #end

  #def after_sign_out_path_for(resource_or_scope)
  #  request.referrer
  #end
end
