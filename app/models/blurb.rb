class Blurb < ActiveRecord::Base

  TOKEN_LENGTH = 10

  after_initialize :set_default_values
  validates_presence_of :token, :text

  belongs_to :user

  mount_uploader :image_url, BackgroundUploader

  def to_param
    self.token
  end

  def username
    user.try(:name).presence || 'Anonymous'
  end

  def background
    if custom_background?
      image_url.url
    else
      self[:image_url]
    end
  end

  def custom_background?
    image_url.path.present? and !image_url.path.include? 'http'
  end


  def image_attribution
    @_image_info ||= custom_background? ? nil : image_list.info_for_url(background)
  end

  def mood
    @_mood ||= image_attribution and image_attribution.mood
  end

  def mood=(mood)
    self.image_url = image_list.random_image(mood)
  end

  def color
    image_list.color_for_url(background)
  end

  private

  def set_default_values
    self[:image_url] ||= image_list.random_image
    self.token  ||= SecureRandom.urlsafe_base64(TOKEN_LENGTH)
    self.time   ||= DateTime.now
  end

  def image_list
    @_images ||= Images.new
  end

end
