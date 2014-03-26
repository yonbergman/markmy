class RegistrationsController < Devise::RegistrationsController

  before_filter :just_for_guest_accounts, only: [:edit, :update]

  def new
    build_resource({})
    @user.name = nil
    respond_with self.resource
  end

  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    @user = User.find(current_user.id)
    @user.guest_account = false
    if @user.update_attributes(account_update_params)
      # Sign in the user bypassing validation in case his password changed
      sign_in @user, :bypass => true
      redirect_to after_update_path_for(@user)
    else
      render "edit"
    end
  end

  def just_for_guest_accounts
    require_no_authentication if user_signed_in? and !current_user.guest_account?
  end
end
