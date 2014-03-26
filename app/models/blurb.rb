class Blurb < ActiveRecord::Base

  TOKEN_LENGTH = 10

  after_initialize :set_default_values
  validates_presence_of :token, :text

  belongs_to :user

  mount_uploader :custom_background, BackgroundUploader

  def to_param
    self.token
  end

  def username
    user.try(:name).presence || 'Anonymous'
  end

  def background
    if custom_background?
      custom_background_url
    else
      image_url
    end
  end

  def custom_background?
    custom_background.present?
  end

  def image_attribution
    @_image_info ||= image_list.info_for_url(image_url)
  end

  def mood
    return nil if custom_background?
    @_mood ||= image_attribution.mood
  end

  def mood=(mood)
    self.remove_custom_background!
    self.image_url = image_list.random_image(mood)
  end

  def color
    image_list.color_for_url(background)
  end

  private

  def set_default_values
    self.image_url ||= image_list.random_image
    self.token  ||= SecureRandom.urlsafe_base64(TOKEN_LENGTH)
    self.time   ||= DateTime.now
  end

  def image_list
    @_images ||= Images.new
  end

end
