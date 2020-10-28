class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :set_current_end_user


    def after_sign_in_path_for(resource)
      case resource
      when Admin
          admin_root_path
      when EndUser
          root_path
      end
    end

    def after_sign_out_path_for(resource)
        root_path(resource)
    end

    def set_current_end_user
      @current_end_user = EndUser.find_by(id: session[:end_user_id])
    end


   protected

     def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :phone_number, :deleted, :zipcord])
     end

end

