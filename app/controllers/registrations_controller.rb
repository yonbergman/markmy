class RegistrationsController < Devise::RegistrationsController

  before_filter :hide_guest_password, :only => [:edit]

  def new
    build_resource({})
    @user.name = nil
    respond_with self.resource
  end

  def update
    account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    # 
    # # required for settings form to submit when password is left blank
    # if account_update_params[:password].blank?
    #   account_update_params.delete("password")
    #   account_update_params.delete("password_confirmation")
    # end

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

  private

  def hide_guest_password
    if current_user.guest_account?
      current_user.name = nil
      current_user.email = nil
    end
  end

end
