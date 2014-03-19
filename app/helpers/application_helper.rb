module ApplicationHelper

  def title
    [@title, I18n.translate('site.title')].flatten.compact.join(' - ')
  end

  def description
    @description || I18n.translate('site.description')
  end

  def avatar_url(user)
    default_url = "#{root_url}images/guest.png"
    if user.guest_account?
      default_url
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
    end

  end
end
