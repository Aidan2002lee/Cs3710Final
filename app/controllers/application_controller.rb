class ApplicationController < ActionController::Base
    #configure_permitted_parameters
    before_action :configure_permitted_parameters, if: :devise_controller?

    #Protects methods in class
    protected

    def configure_permitted_parameters
        # Paramters allowed during sign up
        devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :num_of_songs_you_want, :username])
        
        # Parameters that can be updated
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :num_of_songs_you_want, :username])
    end

    #overrride after_sign_in_path
    def after_sign_in_path_for(resource)
      # Redirect to the account profile
      account_path(current_account)
    end

end
