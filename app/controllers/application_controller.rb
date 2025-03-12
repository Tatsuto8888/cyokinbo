class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # ユーザー登録（sign_up）の際に :user_name を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :user_name ])
  end
end
