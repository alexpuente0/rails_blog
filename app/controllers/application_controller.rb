class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_with_token 
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
 
    def authenticate_with_token
      if params[:api_token]
        user = User.find_by_api_token(params[:api_token])
        sign_in(user)
      end
    end

    protected

  def configure_permitted_parameters
    # Permit the `subscribe_newsletter` parameter along with the other
    # sign up parameters.
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
