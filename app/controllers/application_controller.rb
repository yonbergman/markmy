class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def home
    @blurb = Blurb.new
  end

  def create_and_sign_in_guest_account
    user = User.guest_account
    user.save!
    sign_in(user)
  end

end
