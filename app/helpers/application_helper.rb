module ApplicationHelper

  def title
    [@title, I18n.translate('site.title')].flatten.compact.join(' - ')
  end

  def description
    @description || I18n.translate('site.description')
  end

  def avatar_url(user)
    default_url = image_url('icon120.png')
    if user.guest_account?
      default_url
    else
      gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
      "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=#{CGI.escape(default_url)}"
    end
  end

  def simple_date(datetime)
    if datetime.today?
      datetime.strftime "%H:%M"
    elsif (datetime + 1.month > Time.now) #this month
      datetime.strftime "%A, %b %d"
    else
      datetime.strftime "%b %d, %Y"
    end
  end
end
