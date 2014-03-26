module BlurbsHelper

  def author?
    @blurb.user == current_user
  end

  def blurb_user_attributes
    return {} unless author?
    if current_user.guest_account?
      {
        class: 'has-popover has-link',
        data: {
        url: edit_user_registration_path,
        toggle: 'popover',
        placement: 'bottom',
        container: 'body',
        trigger: 'hover',
        title: '<i class="fa fa-user"></i> Why am I Anonymous?',
        html: 'true',
        content: 'You are using a temporary guest account, click to <strong>Create Account</strong> and set your name.'}
      }
    else
      {}
    end
  end
end
