module Admins
  class ApplicationController < ::ApplicationController
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    before_action :authenticate_admin!
    # before_filter :configure_permitted_parameters, if: :devise_controller?


    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation,:name) }
    end

    def after_sign_in_path_for(resource)
      case resource
      when User
        users_top_index_path(resource)
      when Admin
        admins_top_index_path(resource)
      end
    end

  end
end
