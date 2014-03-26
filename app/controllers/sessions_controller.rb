class SessionsController < Devise::SessionsController
  skip_before_filter :require_no_authentication, only: [ :new, :create ]
  before_filter :handle_user_sign_in_on_new, only: [:new]
  before_filter :handle_user_signed_in_on_create, only: [:create]
  after_filter :move_blurbs, only: [:create]
  after_filter :clear_flash, only: [:destroy]

  private

  def handle_user_sign_in_on_new
    require_no_authentication if user_signed_in? and !current_user.guest_account?
    # flash[:notice] = nil
  end

  def handle_user_signed_in_on_create
    if user_signed_in?
      require_no_authentication and return unless current_user.guest_account?
      @signed_out_user = current_user
      sign_out(resource_name)
      if not warden.authenticate?(auth_options)
        sign_in(@signed_out_user)
        flash[:alert] = I18n.translate('devise.failure.invalid')
        respond_with resource, location: new_user_session_path
        return
      end
    end
  end

  def move_blurbs
    if @signed_out_user
      current_user.blurbs << @signed_out_user.blurbs
      current_user.save
    end
  end

  def clear_flash
    flash.clear
  end


end
