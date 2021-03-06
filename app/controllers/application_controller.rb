class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def home
    @blurb = Blurb.new(text: params[:text], mood: params[:mood])
  end

  def create_and_sign_in_guest_account
    user = User.guest_account
    user.save!
    sign_in(user)
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end

  def admin_signed_in?
    user_signed_in? and current_user.admin?
  end
  helper_method :admin_signed_in?

end
