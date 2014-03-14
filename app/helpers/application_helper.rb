module ApplicationHelper

  def title
    [@title, I18n.translate('site.title')].flatten.compact.join(' - ')
  end

  def description
    @description || I18n.translate('site.description')
  end
end
