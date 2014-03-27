module BlurbsHelper

  def twitter_share_url
    'https://twitter.com/share?' + {
      url: blurb_url(@blurb),
      text: t('blurb.share_description'),
      via: 'MarkMyApp'
    }.to_param
  end

  def facebook_share_url
    'https://www.facebook.com/sharer/sharer.php?' + {
      u: blurb_url(@blurb),
    }.to_param
  end


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
        # title: '<i class="fa fa-user"></i> Click to set your name',
        html: 'true',
        # content: 'You are using a temporary guest account, click to <strong>Create Account</strong> and set your name.'}
        content:  '<i class="fa fa-user"></i> Click to set your name'
        }
      }
    else
      {}
    end
  end
end
