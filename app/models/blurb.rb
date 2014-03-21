class Blurb < ActiveRecord::Base

  TOKEN_LENGTH = 10

  after_initialize :set_default_values
  validates_presence_of :token, :text

  belongs_to :user

  def to_param
    self.token
  end

  def username
    user.try(:name).presence || 'Anonymous'
  end

  def mood
    @_mood ||= image_list.mood_for_url(image_url)
  end

  def mood=(mood)
    self.image_url = image_list.random_image(mood)
  end

  def color
    image_list.color_for_url(image_url)
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
